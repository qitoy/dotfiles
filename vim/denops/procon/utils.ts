import {
    readableStreamFromReader,
    mergeReadableStreams,
    TextLineStream,
} from "https://deno.land/std@0.171.0/streams/mod.ts";
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

export async function ojTest(problem: Problem, exec: string[]): Promise<{ success: boolean; output: string[]; }> {
    const tmpDir = Deno.makeTempDirSync();
    (problem.tests ?? []).forEach((test, index) => {
        const name = test.name ?? `sample-${index+1}`;
        Deno.writeTextFileSync(`${tmpDir}/${name}.in`, test.input);
        Deno.writeTextFileSync(`${tmpDir}/${name}.out`, test.output);
    });
    const p = Deno.run({
        cmd: ["sh", "-c", `oj test -N -c '${exec.join(' ')}' --tle ${problem.timeLimit ?? 2} -d ${tmpDir}`],
        stderr: "piped",
        stdin: "null",
        stdout: "piped",
    });
    const stream = mergeReadableStreams(
        readableStreamFromReader(p.stdout),
        readableStreamFromReader(p.stderr)
    ).pipeThrough(new TextDecoderStream())
    .pipeThrough(new TextLineStream());
    const output = [];
    for await (const line of stream) {
        output.push(line);
    }
    const success = (await p.status()).success
    return { success, output, };
}
