import {
    mergeReadableStreams, TextLineStream,
    $,
    ensureDir,
} from "./deps.ts";
import { Problem } from "./types.ts";

export async function parseResponse<T>(...query: string[]): Promise<T> {
    const response = await $`oj-api ${query}`.stderr("null").json();
    if(response.status as string !== "ok") {
        throw Error((response.messages as string[]).join('\n'));
    }
    return response.result as T;
}

export async function ojTest(problem: Problem, exec: string[], buffer: (line: string) => Promise<void>): Promise<boolean> {
    await ensureDir("/tmp/procon");
    const tmpDir = Deno.makeTempDirSync({ dir: "/tmp/procon" });
    (problem.tests ?? []).forEach((test) => {
        const name = test.name!;
        Deno.writeTextFileSync(`${tmpDir}/${name}.in`, test.input);
        Deno.writeTextFileSync(`${tmpDir}/${name}.out`, test.output);
    });
    const child = $`oj test -N -c ${exec.join(' ')} --tle ${problem.timeLimit ?? 2} -d ${tmpDir}`
        .stdout("piped").stderr("piped").noThrow().spawn();
    const stream = mergeReadableStreams(child.stdout(), child.stderr())
    .pipeThrough(new TextDecoderStream())
    .pipeThrough(new TextLineStream());
    for await (const line of stream) {
        await buffer(line);
    }
    const success = (await child).code === 0;
    Deno.removeSync(tmpDir, { recursive: true });
    return success;
}

export async function ojSubmit(problem: Problem, file: string): Promise<void> {
    await $`oj submit -y --wait=0 ${problem.url} ${file}`.quiet();
}
