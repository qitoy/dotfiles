import { Denops } from "https://deno.land/x/denops_std@v3.8.2/mod.ts";
import { map } from "https://deno.land/x/denops_std@v3.8.2/mapping/mod.ts";
import { deletebufline, setbufline } from "https://deno.land/x/denops_std@v3.8.2/function/mod.ts";
import { assertString, ensureObject } from "https://deno.land/x/unknownutil@v2.0.0/mod.ts";
import { templateCpp } from "./cpp.ts";

export async function main(denops: Denops): Promise<void> {
    denops.dispatcher = {
        async proconPrepare(url: unknown): Promise<void> {
            assertString(url);
            const contest = await getContest(url);
            await prepareDir(contest);
            denops.cmd("echo 'dir prepared'");
            await downloadTest(contest);
            denops.cmd("echo 'test downloaded'");
        },
        async proconInit(): Promise<void> {
            await deletebufline(denops, "", 1, "$");
            await setbufline(denops, "", 1, templateCpp.split("\n"));
        },
    };
    await denops.cmd(
        `command! -nargs=1 ProconPrepare call denops#notify("${denops.name}", "proconPrepare", [<f-args>])`
    );
    await map(
        denops,
        "<Plug>(procon-init)",
        `<Cmd>call denops#notify("${denops.name}", "proconInit", [])<CR>`,
        {
            mode: "n",
            noremap: true,
        },
    );
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

async function prepareDir(contest: Contest): Promise<void> {
    Deno.mkdirSync(contest.name);
    await Promise.all(contest.problems.map(async (problem: Problem) => {
        const problemDir = `${contest.name}/${problem.context.alphabet}`;
        await Deno.mkdir(problemDir);
        return Deno.writeTextFile(`${problemDir}/main.cpp`, templateCpp);
    }));
}

async function downloadTest(contest: Contest): Promise<void> {
    for(const problem of contest.problems) {
        const problemDir = `${contest.name}/${problem.context.alphabet}`;
        const p = Deno.run({
            cmd: ["oj", "download", "-d", `${contest.name}/${problem.context.alphabet}/test/`, problem.url],
            stdin: "null",
            stdout: "null",
            stderr: "null",
        });
        await Deno.writeTextFile(`${problemDir}/.contest_url`, problem.url);
        await p.status();
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
