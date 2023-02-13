import { ModuleType, Contest } from "../procon/types.ts";
import $ from "https://deno.land/x/dax@0.24.1/mod.ts";
import { join, dirname } from "https://deno.land/std@0.171.0/path/mod.ts";

const rootDir = "/home/qitoy/procon/Rust";

export const Module: ModuleType = {
    templates: {"main.rs": String.raw`use proconio::input;

fn main() {
    todo!();
}`},
    testPre: async (sourcePath: string) => {
        const bin = (() => {
            if(dirname(sourcePath) === rootDir) {
                return "main";
            } else {
                const path = sourcePath.split("/");
                return `${path.at(-3)!.replaceAll(" ", "_")}-${path.at(-2)}`;
            }
        })();
        const result = await $`cargo build --bin ${bin}`
            .cwd(rootDir).quiet();
        if(result.code !== 0) {
            throw Error("Conpile Fault");
        }
        return [join(rootDir, "target", "debug", bin)];
    },
    submitPre: (sourcePath: string) => Promise.resolve(sourcePath),
    preparePre: (contest: Contest) => {
        contest.problems.forEach((problem, index) => {
            const problemDir = `${contest.name}/${problem.context.alphabet ?? index+1}`;
            const bin = `${contest.name.replaceAll(" ", "_")}-${problem.context.alphabet ?? index+1}`;
            Deno.writeTextFileSync(
                join(rootDir, "Cargo.toml"),
                `\n[[bin]]\nname = "${bin}"\npath = "${join(problemDir, "main.rs")}"\n`,
                { append: true });
        });
        return Promise.resolve();
    },

};
