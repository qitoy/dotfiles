import * as yaml from "https://deno.land/std@0.171.0/encoding/yaml.ts";
import { Denops } from "https://deno.land/x/denops_std@v3.8.2/mod.ts";
import { map } from "https://deno.land/x/denops_std@v3.8.2/mapping/mod.ts";
import * as fn from "https://deno.land/x/denops_std@v3.8.2/function/mod.ts";
import { assertString } from "https://deno.land/x/unknownutil@v2.0.0/mod.ts";
import { templateCpp } from "./cpp.ts";
import { Contest, Problem } from "./types.ts";
import { perseResponse } from "./utils.ts";

export async function main(denops: Denops): Promise<void> {
    denops.dispatcher = {
        async proconPrepare(url: unknown): Promise<void> {
            assertString(url);
            const contest = await perseResponse<Contest>("get-contest", url);
            prepareDir(contest);
            await denops.cmd("echo 'prepared'");
        },
        async proconInit(): Promise<void> {
            await fn.deletebufline(denops, "", 1, "$");
            await fn.setbufline(denops, "", 1, templateCpp.split("\n"));
        },
        async proconDownload(url: unknown): Promise<void> {
            assertString(url);
            const problem = await perseResponse<Problem>("get-problem", url);
            Deno.writeTextFileSync(`${await fn.expand(denops, "%:p:h")}/probleminfo.yaml`, yaml.stringify(problem));
            await denops.cmd("echo 'success.'");
        },
        async proconTest(): Promise<void> {
            const currentDir = await fn.expand(denops, "%:p:h");
            const problem = yaml.parse(Deno.readTextFileSync(`${currentDir}/probleminfo.yaml`)) as Problem;
            try {
                Deno.removeSync(`${currentDir}/test`, { recursive: true });
            } catch { /* do noting */ }
            Deno.mkdirSync(`${currentDir}/test`);
            // TODO
            (problem.tests ?? []).forEach((test, index) => {
                const name = test.name ?? `sample-${index+1}`;
                Deno.writeTextFileSync(`${currentDir}/test/${name}.in`, test.input);
                Deno.writeTextFileSync(`${currentDir}/test/${name}.out`, test.output);
            });
            await denops.cmd("QuickRun procon/test");
        },
        async proconSubmit(bang: unknown): Promise<void> {
            assertString(bang);
            const currentDir = await fn.expand(denops, "%:p:h");
            const problem = yaml.parse(Deno.readTextFileSync(`${currentDir}/probleminfo.yaml`)) as Problem;
            // TODO
            if(bang !== "!") {
                try {
                    Deno.removeSync(`${currentDir}/test`, { recursive: true });
                } catch { /* do noting */ }
                Deno.mkdirSync(`${currentDir}/test`);
                // TODO
                (problem.tests ?? []).forEach((test, index) => {
                    const name = test.name ?? `sample-${index+1}`;
                    Deno.writeTextFileSync(`${currentDir}/test/${name}.in`, test.input);
                    Deno.writeTextFileSync(`${currentDir}/test/${name}.out`, test.output);
                });
            }
            Deno.writeTextFileSync(`${currentDir}/.contest_url`, problem.url);
            await denops.cmd(`QuickRun procon/submit${bang}`);
        },
    };
    await denops.cmd(`command! -nargs=1 ProconPrepare call denops#notify("${denops.name}", "proconPrepare", [<f-args>])`);
    await denops.cmd(`command! -nargs=1 ProconDownload call denops#notify("${denops.name}", "proconDownload", [<f-args>])`);
    await denops.cmd(`command! ProconTest call denops#notify("${denops.name}", "proconTest", [])`);
    await denops.cmd(`command! -bang ProconSubmit call denops#notify("${denops.name}", "proconSubmit", [<q-bang>])`);
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

function prepareDir(contest: Contest): void {
    Deno.mkdirSync(contest.name);
    contest.problems.forEach(async (problem, index) => {
        const problemDir = `${contest.name}/${problem.context.alphabet ?? index+1}`;
        Deno.mkdirSync(problemDir);
        Deno.writeTextFileSync(`${problemDir}/main.cpp`, templateCpp);
        Deno.writeTextFileSync(`${problemDir}/probleminfo.yaml`, yaml.stringify(await perseResponse<Problem>("get-problem", problem.url)));
    });
}
