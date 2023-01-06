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
