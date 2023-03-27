import { ModuleType } from "../procon/types.ts";
import $ from "https://deno.land/x/dax@0.24.1/mod.ts";
import { join, dirname } from "https://deno.land/std@0.171.0/path/mod.ts";
import { ensureDir } from "https://deno.land/std@0.171.0/fs/mod.ts";

const rootDir = join(Deno.env.get("HOME")!, "procon", "Rust");

export const Module: ModuleType = {
    main: {
        name: "main.rs",
        source: String.raw`#![allow(unused_imports)]

fn main() {
    todo!();
}

use proconio::{ input, marker::* };
use ac_library_rs::ModInt998244353 as Mint;
use itertools::{Itertools, iproduct};
use num::integer::Integer;
use qitoy_prelude::*;
`
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

    submitPre: async (sourcePath: string) => {
        const bin = makeBinname(sourcePath);
        await ensureDir("/tmp/procon");
        const submitPath = await Deno.makeTempFile({ dir: "/tmp/procon", suffix: ".rs" });
        await $`cargo executable-payload --bin ${bin} -o ${submitPath}`
            .cwd(dirname(sourcePath)).quiet();
        return submitPath;
    },

    preparePost: async (contestDir: string, problemDirs: string[]) => {
        await Deno.writeTextFile(
            join(contestDir, "Cargo.toml"),
            /*{{{*/ `[package]
name = "${contestDir.replace("/", "-")}"
version = "0.1.0"
edition = "2021"

[dependencies]
ac-library-rs = { git = "https://github.com/rust-lang-ja/ac-library-rs", rev = "c03e2cab25a5997ed00674fee5f821e5a5433b42" }
once_cell = "=1.17.0"
static_assertions = "=1.1.0"
varisat = "=0.2.2"
memoise = "=0.3.2"
argio = "=0.2.0"
bitvec = "=1.0.1"
counter = "=0.5.7"
hashbag = "0.1.10"
pathfinding = "=4.2.1"
recur-fn = "=2.2.0"
indexing = "=0.4.1"
index_vec = "=0.1.3"
# with_locals = "=0.3.0"
amplify = "=3.13.0"
ouroboros = "=0.15.5"
easy-ext = "=1.0.1"
num = "=0.4.0"
num-bigint = "=0.4.3"
num-complex = "=0.4.3"
num-integer = "=0.1.45"
num-iter = "=0.1.43"
num-rational = "=0.4.1"
num-traits = "=0.2.15"
num-derive = "=0.3.0"
ndarray = "=0.15.6"
nalgebra = "=0.32.1"
alga = "=0.9.3"
libm = "=0.2.6"
rand = { version = "=0.8.5", features = ["small_rng"] }
getrandom = "=0.2.8"
rand_chacha = "=0.3.1"
rand_core = "=0.6.4"
rand_hc = "=0.3.1"
rand_pcg = "=0.3.1"
rand_distr = "=0.4.3"
petgraph = "=0.6.2"
indexmap = "=1.9.2"
regex = "=1.7.1"
lazy_static = "=1.4.0"
ordered-float = "=3.4.0"
ascii = "=1.1.0"
permutohedron = "=0.2.4"
superslice = "=1.0.0"
itertools = "=0.10.5"
itertools-num = "=0.1.3"
maplit = "=1.0.2"
either = "=1.8.1"
im-rc = "=15.1.0"
fixedbitset = "=0.4.2"
bitset-fixed = "=0.1.0"
proconio = { version = "=0.4.3", features = ["derive"] }
text_io = "=0.1.12"
whiteread = "=0.5.0"
rustc-hash = "=1.1.0"
smallvec = "=1.10.0"

qitoy-prelude = { git = "https://github.com/qitoy/rust-library.git" }
qitoy-algorithm-mo = { git = "https://github.com/qitoy/rust-library.git" }
qitoy-utils-float2uint = { git = "https://github.com/qitoy/rust-library.git" }
qitoy-math-combi = { git = "https://github.com/qitoy/rust-library.git" }
qitoy-prime-sieve = { git = "https://github.com/qitoy/rust-library.git" }
qitoy-prime-check = { git = "https://github.com/qitoy/rust-library.git" }
qitoy-prime-factorise = { git = "https://github.com/qitoy/rust-library.git" }
qitoy-string-rolling_hash = { git = "https://github.com/qitoy/rust-library.git" }
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
