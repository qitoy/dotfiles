import { ModuleType } from "../procon/types.ts";
import $ from "https://deno.land/x/dax@0.24.1/mod.ts";
import { join, dirname } from "https://deno.land/std@0.171.0/path/mod.ts";

const rootDir = "/home/qitoy/procon/Rust";

export const Module: ModuleType = {
    main: {
        name: "main.rs",
        source: String.raw`use proconio::input;

fn main() {
    todo!();
}`
    },

    testPre: async (sourcePath: string) => {
        const bin = makeBinname(sourcePath);
        const result = await $`cargo build --bin ${bin}`
            .cwd(dirname(sourcePath)).quiet();
        if(result.code !== 0) {
            throw Error("Conpile Fault");
        }
        return [join(rootDir, "target", "debug", bin)];
    },

    // deno-lint-ignore require-await
    submitPre: async (sourcePath: string) => {
        // const bin = makeBinname(sourcePath);
        // await ensureDir("/tmp/procon");
        // const submitPath = await Deno.makeTempFile({ dir: "/tmp/procon", suffix: ".rs" });
        // await $`cargo executable-payload --bin ${bin} -o ${submitPath}`
        //     .cwd(dirname(sourcePath)).quiet();
        // return submitPath;
        return sourcePath;
    },

    preparePost: async (contestDir: string, problemDirs: string[]) => {
        await Deno.writeTextFile(
            join(contestDir, "Cargo.toml"),
            /*{{{*/ `[package]
name = "${contestDir.replace("/", "-")}"
version = "0.1.0"
edition = "2018"

[dependencies]
num = "=0.2.1"
num-bigint = "=0.2.6"
num-complex = "=0.2.4"
num-integer = "=0.1.42"
num-iter = "=0.1.40"
num-rational = "=0.2.4"
num-traits = "=0.2.11"
num-derive = "=0.3.0"
ndarray = "=0.13.0"
nalgebra = "=0.20.0"
alga = "=0.9.3"
libm = "=0.2.1"
rand = { version = "=0.7.3", features = ["small_rng"] }
getrandom = "=0.1.14"
rand_chacha = "=0.2.2"
rand_core = "=0.5.1"
rand_hc = "=0.2.0"
rand_pcg = "=0.2.1"
rand_distr = "=0.2.2"
petgraph = "=0.5.0"
indexmap = "=1.3.2"
regex = "=1.3.6"
lazy_static = "=1.4.0"
ordered-float = "=1.0.2"
ascii = "=1.0.0"
permutohedron = "=0.2.4"
superslice = "=1.0.0"
itertools = "=0.9.0"
itertools-num = "=0.1.3"
maplit = "=1.0.2"
either = "=1.5.3"
im-rc = "=14.3.0"
fixedbitset = "=0.2.0"
bitset-fixed = "=0.1.0"
proconio = { version = "=0.3.6", features = ["derive"] }
text_io = "=0.1.8"
whiteread = "=0.5.0"
rustc-hash = "=1.1.0"
smallvec = "=1.2.0"
`, /*}}}*/
        );
        for(const problemDir of problemDirs) {
            const bin = `${contestDir.replace("/", "-")}-${problemDir.toLowerCase()}`;
            await Deno.writeTextFile(
                join(contestDir, "Cargo.toml"),
                `\n[[bin]]\nname = "${bin}"\npath = "${join(problemDir, "main.rs")}"\n`,
                    { append: true },
            );
        }
    },
};

function makeBinname(sourcePath: string): string {
    if(dirname(sourcePath) === rootDir) {
        return "main";
    } else {
        const path = sourcePath.split("/");
        return `${path.at(-4)}-${path.at(-3)}-${path.at(-2)?.toLowerCase()}`;
    }
}
