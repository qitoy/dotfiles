import { Denops } from "https://deno.land/x/denops_std@v3.8.2/mod.ts";
import { assertString, ensureObject } from "https://deno.land/x/unknownutil@v2.0.0/mod.ts";
import { templateCpp } from "./cpp.ts";

export async function main(denops: Denops): Promise<void> {
    denops.dispatcher = {
        async debug(url: unknown): Promise<unknown> {
            assertString(url);
            return await proconPrepare(url);
        },
    };
}

type Problem = {
    url: string;
    context: {
        alphabet: string;
    }
};

type Contest = {
    name: string;
    problems: Problem[];
};

async function proconPrepare(url: string): Promise<void> {
    const contest = await getContest(url);
    for(const problem of contest.problems) {
        await Deno.mkdir(`${contest.name}/${problem.context.alphabet}`, { recursive: true });
        await Deno.writeTextFile(`${contest.name}/${problem.context.alphabet}/main.cpp`, templateCpp);
        await Deno.writeTextFile(`${contest.name}/${problem.context.alphabet}/.contest_url`, problem.url);
    }
}

async function getContest(url: string): Promise<Contest> {
    const p = Deno.run({
        cmd: ["oj-api", "get-contest", url],
        stdin: "null",
        stdout: "piped",
        stderr: "null",
    });
    const result = ensureObject(JSON.parse(new TextDecoder().decode(await p.output())));
    if(result.status as string !== "ok") {
        throw new Error(result.messages as string);
    }
    return result.result as Contest;
}
