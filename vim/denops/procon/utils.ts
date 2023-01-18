import {
    readableStreamFromReader,
    mergeReadableStreams,
    TextLineStream,
} from "./deps.ts";
import { Problem } from "./types.ts";

export async function parseResponse<T>(...query: string[]): Promise<T> {
    const p = Deno.run({
        cmd: ["oj-api", ...query],
        stdin: "null",
        stdout: "piped",
        stderr: "null",
    });
    const response = JSON.parse(new TextDecoder().decode(await p.output()));
    if(response.status as string !== "ok") {
        throw Error((response.messages as string[]).join('\n'));
    }
    return response.result as T;
}

export async function cppCompile(source: string): Promise<{ success: boolean, execFile: string }> {
    const sourceFile = Deno.makeTempFileSync({ prefix: "procon_", suffix: ".cpp" });
    const execFile = sourceFile.slice(0,-4);
    Deno.writeTextFileSync(sourceFile, source);
    const p = Deno.run({
        cmd: ["g++", "-std=gnu++17", "-Wall", "-Wextra", "-DLOCAL", "-O2", sourceFile, "-o", execFile],
        stderr: "null",
        stdin: "null",
        stdout: "null",
    });
    const success = (await p.status()).success;
    Deno.removeSync(sourceFile);
    return { success, execFile };
}

export async function cppBundle(source: string): Promise<string> {
    const submitFile = Deno.makeTempFileSync({ prefix: "procon_", suffix: ".cpp" });
    const tmpFile = Deno.makeTempFileSync({ prefix: "procon_", suffix: ".cpp" });
    Deno.writeTextFileSync(tmpFile, source);
    const p = Deno.run({
        cmd: ["oj-bundle", tmpFile],
        cwd: "/home/qitoy/Library/cpp-library",
        stdin: "null",
        stdout: "piped",
        stderr: "null",
    });
    Deno.writeFileSync(submitFile, await p.output());
    Deno.removeSync(tmpFile);
    return submitFile;
}

export async function ojTest(problem: Problem, exec: string[], buffer: (line: string) => Promise<void>): Promise<boolean> {
    const tmpDir = Deno.makeTempDirSync({ prefix: "procon_" });
    (problem.tests ?? []).forEach((test) => {
        const name = test.name!;
        Deno.writeTextFileSync(`${tmpDir}/${name}.in`, test.input);
        Deno.writeTextFileSync(`${tmpDir}/${name}.out`, test.output);
    });
    const p = Deno.run({
        cmd: ["oj", "test", "-N", "-c", exec.join(' '), "--tle", `${problem.timeLimit ?? 2}`, "-d", tmpDir],
        stderr: "piped",
        stdin: "null",
        stdout: "piped",
    });
    const stream = mergeReadableStreams(
        readableStreamFromReader(p.stdout),
        readableStreamFromReader(p.stderr)
    ).pipeThrough(new TextDecoderStream())
    .pipeThrough(new TextLineStream());
    for await (const line of stream) {
        await buffer(line);
    }
    const success = (await p.status()).success;
    Deno.removeSync(tmpDir, { recursive: true });
    return success;
}

export async function ojSubmit(problem: Problem, file: string): Promise<void> {
    const p = Deno.run({
        cmd: ["oj", "submit", "-y", "--wait=0", problem.url, file],
        stdin: "null",
        stdout: "null",
        stderr: "null",
    });
    await p.status();
}
