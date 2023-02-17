import {
    yaml,
    toFileUrl,
    Denops, map, fn, op,
    assertString, assertObject,
} from "./deps.ts";
import { Contest, Problem, ModuleType } from "./types.ts";
import {
    parseResponse,
    ojTest, ojSubmit,
} from "./utils.ts";
import { config, setConfig } from "./config.ts";

export async function main(denops: Denops): Promise<void> {
    denops.dispatcher = {
        setConfig(newConfig: unknown): Promise<void> {
            assertObject(newConfig);
            setConfig(newConfig);
            return Promise.resolve();
        },

        getConfig(key: unknown): Promise<unknown> {
            assertString(key);
            return Promise.resolve(config[key]);
        },

        async proconPrepare(url: unknown): Promise<void> {
            assertString(url);
            const contest = await parseResponse<Contest>("get-contest", url);
            await prepareDir(denops, contest);
            await denops.cmd("echo 'prepared'");
        },

        async proconInit(): Promise<void> {
            const templates = (await getModule(denops)).templates;
            await fn.deletebufline(denops, "", 1, "$");
            await fn.setbufline(denops, "", 1, templates[await fn.expand(denops, "%:t") as string].split("\n"));
        },

        async proconDownload(url: unknown): Promise<void> {
            assertString(url);
            const problem = await parseResponse<Problem>("get-problem", url);
            (problem.tests ?? []).forEach((test, index, tests) => {
                if(test.name === undefined) {
                    tests[index].name = `sample-${index+1}`;
                }
            });
            Deno.writeTextFileSync(`${await fn.expand(denops, "%:p:h")}/probleminfo.yaml`, yaml.stringify(problem));
            await denops.cmd("echo 'success.'");
        },

        async proconTest(): Promise<void> {
            const problem = yaml.parse(Deno.readTextFileSync(`${await fn.expand(denops, "%:p:h")}/probleminfo.yaml`)) as Problem;
            const exec = await (await getModule(denops)).testPre(await fn.expand(denops, "%:p") as string);
            await denops.call("procon#buffer#open", "test");
            await ojTest(problem, exec, async (line) => {
                await denops.call("procon#buffer#append", "test", line);
            });
        },

        async proconSubmit(bang: unknown): Promise<void> {
            assertString(bang);
            const problem = yaml.parse(Deno.readTextFileSync(`${await fn.expand(denops, "%:p:h")}/probleminfo.yaml`)) as Problem;
            const sourcePath = await fn.expand(denops, "%:p") as string;
            if(bang !== "!") {
                const exec = await (await getModule(denops)).testPre(sourcePath);
                const output: string[] = [];
                const success = await ojTest(problem, exec, (line) => {
                    output.push(line);
                    return Promise.resolve();
                });
                if(!success) {
                    await denops.batch(
                        ["procon#buffer#open", "test"],
                        ["procon#buffer#append", "test", output],
                    );
                    return;
                }
                if(await fn.confirm(denops, "Submit?", "&Yes\n&No", 0, "Question") !== 1) {
                    denops.cmd(`echo "canceled"`);
                    return;
                }
            }
            const submitFile = await (await getModule(denops)).submitPre(sourcePath);
            await ojSubmit(problem, submitFile);
        },

        async proconBrowse(): Promise<void> {
            const problem = yaml.parse(Deno.readTextFileSync(`${await fn.expand(denops, "%:p:h")}/probleminfo.yaml`)) as Problem;
            denops.call("openbrowser#open", problem.url);
        },
    };
    await denops.cmd(`command! -nargs=1 ProconPrepare call denops#notify("${denops.name}", "proconPrepare", [<f-args>])`);
    await denops.cmd(`command! -nargs=1 ProconDownload call denops#notify("${denops.name}", "proconDownload", [<f-args>])`);
    await denops.cmd(`command! ProconTest call denops#notify("${denops.name}", "proconTest", [])`);
    await denops.cmd(`command! -bang ProconSubmit call denops#notify("${denops.name}", "proconSubmit", [<q-bang>])`);
    await denops.cmd(`command! ProconBrowse call denops#notify("${denops.name}", "proconBrowse", [])`);
    await denops.cmd(`command! -nargs=1 ProconConfig call procon#config(<args>)`);
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

async function prepareDir(denops: Denops, contest: Contest): Promise<void> {
    const contestDir = contest.url.replace(/^https:\/\/(\w+)\..+\/(\w+)$/, "$1/$2");
    Deno.mkdirSync(contestDir, { recursive: true });
    const main = (await getModule(denops)).main;
    const problemDirs: string[] = [];
    contest.problems.forEach(async (problem, index) => {
        problemDirs.push(`${problem.context.alphabet ?? index+1}`);
        const problemDir = `${contestDir}/${problem.context.alphabet ?? index+1}`;
        Deno.mkdirSync(problemDir);
        Deno.writeTextFileSync(`${problemDir}/${main.name}`, main.source);
        problem = await parseResponse<Problem>("get-problem", problem.url);
        (problem.tests ?? []).forEach((test, index, tests) => {
            if(test.name === undefined) {
                tests[index].name = `sample-${index+1}`;
            }
        });
        Deno.writeTextFileSync(`${problemDir}/probleminfo.yaml`, yaml.stringify(problem));
    });
    await (await getModule(denops)).preparePost(contestDir, problemDirs);
}

const cacheModules: Record<string, ModuleType> = {};

async function getModule(denops: Denops): Promise<ModuleType> {
    const lang = config.lang as string;
    if(!(lang in cacheModules)) {
        const path = await fn.globpath(
            denops,
            await op.runtimepath.getGlobal(denops),
            `denops/@procon-${lang}/mod.ts`,
            1,
        ) as string;
        cacheModules[lang] = (await import(toFileUrl(path).href)).Module;
    }
    return cacheModules[lang];
}
