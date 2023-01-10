import * as yaml from "https://deno.land/std@0.171.0/encoding/yaml.ts";
import { Denops } from "https://deno.land/x/denops_std@v3.8.2/mod.ts";
import { map } from "https://deno.land/x/denops_std@v3.8.2/mapping/mod.ts";
import * as fn from "https://deno.land/x/denops_std@v3.8.2/function/mod.ts";
import { assertString } from "https://deno.land/x/unknownutil@v2.0.0/mod.ts";
import { templateCpp } from "./cpp.ts";
import { Contest, Problem } from "./types.ts";
import { parseResponse, ojTest } from "./utils.ts";

export async function main(denops: Denops): Promise<void> {
    denops.dispatcher = {
        async proconPrepare(url: unknown): Promise<void> {
            assertString(url);
            const contest = await parseResponse<Contest>("get-contest", url);
            prepareDir(contest);
            await denops.cmd("echo 'prepared'");
        },
        async proconInit(): Promise<void> {
            await fn.deletebufline(denops, "", 1, "$");
            await fn.setbufline(denops, "", 1, templateCpp.split("\n"));
        },
        async proconDownload(url: unknown): Promise<void> {
            assertString(url);
            const problem = await parseResponse<Problem>("get-problem", url);
            Deno.writeTextFileSync(`${await fn.expand(denops, "%:p:h")}/probleminfo.yaml`, yaml.stringify(problem));
            await denops.cmd("echo 'success.'");
        },
        async proconTest(): Promise<void> {
            const problem = yaml.parse(Deno.readTextFileSync(`${await fn.expand(denops, "%:p:h")}/probleminfo.yaml`)) as Problem;
            const { output } = await cppTest(problem, (await fn.getbufline(denops, "%", 1, "$")).join("\n"));
            await denops.call("procon#buffer", "test", output);
        },
        async proconSubmit(bang: unknown): Promise<void> {
            assertString(bang);
            const problem = yaml.parse(Deno.readTextFileSync(`${await fn.expand(denops, "%:p:h")}/probleminfo.yaml`)) as Problem;
            const source = (await fn.getbufline(denops, "%", 1, "$")).join("\n");
            if(bang !== "!") {
                const { success, output } = await cppTest(problem, source);
                if(!success) {
                    await denops.call("procon#buffer", "test", output);
                    return;
                }
                if(await fn.confirm(denops, "Submit?", "&Yes\n&No", 0, "Question") !== 1) {
                    denops.cmd(`echo "canceled"`);
                    return;
                }
            }
            await cppSubmit(problem, source);
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

async function cppTest(problem: Problem, source: string) {
    const tmpFile = Deno.makeTempFileSync({ suffix: ".cpp" });
    Deno.writeTextFileSync(tmpFile, source);
    const p = Deno.run({
        cmd: ["g++", "-std=gnu++17", "-Wall", "-Wextra", "-DLOCAL", "-O2", tmpFile, "-o", tmpFile.slice(0,-4)],
        stderr: "null",
        stdin: "null",
        stdout: "null",
    });
    await p.status();
    const result = await ojTest(problem, [tmpFile.slice(0,-4)]);
    Deno.removeSync(tmpFile);
    Deno.removeSync(tmpFile.slice(0,-4));
    return result;
}

async function cppSubmit(problem: Problem, source: string): Promise<void> {
    const tmpFile = Deno.makeTempFileSync({ suffix: ".cpp" });
    const submitFile = tmpFile.slice(0,-4);
    Deno.writeTextFileSync(tmpFile, source);
    const p1 = Deno.run({
        cmd: ["oj-bundle", "-I", "/home/qitoy/Library/cpp-library", tmpFile],
        stdin: "null",
        stdout: "piped",
        stderr: "null",
    });
    Deno.writeFileSync(submitFile, await p1.output());
    const p2 = Deno.run({
        cmd: ["oj", "submit", "-y", "--wait=0", "-l", "4003", problem.url, submitFile],
        stdin: "null",
        stdout: "null",
        stderr: "null",
    });
    await p2.status();
    Deno.removeSync(tmpFile);
    Deno.removeSync(submitFile);
}

function prepareDir(contest: Contest): void {
    Deno.mkdirSync(contest.name);
    contest.problems.forEach(async (problem, index) => {
        const problemDir = `${contest.name}/${problem.context.alphabet ?? index+1}`;
        Deno.mkdirSync(problemDir);
        Deno.writeTextFileSync(`${problemDir}/main.cpp`, templateCpp);
        Deno.writeTextFileSync(`${problemDir}/probleminfo.yaml`, yaml.stringify(await parseResponse<Problem>("get-problem", problem.url)));
    });
}
