import { Module } from "https://raw.githubusercontent.com/qitoy/dps-procon.vim/main/denops/procon/config.ts";
import $ from "https://deno.land/x/dax@0.34.0/mod.ts";

const libPath = $.path.join(Deno.env.get("HOME")!, ".local", "include", "cpp-library");

export const modules: Record<string, Module> = {
  cpp: {
    main: {
      name: "main.cpp",
      source: String.raw`/*{{{ begin template */
#include <bits/stdc++.h>
using namespace std; using ll = long long;
template <class T> inline bool chmin(T &a, T b) { if (a > b) { a = b; return true; } return false; }
template <class T> inline bool chmax(T &a, T b) { if (a < b) { a = b; return true; } return false; }
template <class T> istream &operator>>(istream &is, vector<T> &vec) { for (auto&& v : vec) is >> v; return is; }
void Main(); int main() { cin.tie(nullptr); ios_base::sync_with_stdio(false); cout << fixed << setprecision(10); Main(); }
/*}}} end template */

void Main() {



}`,
    },
    testPre: async (sourcePath: string) => {
      await $.fs.ensureDir("/tmp/procon");
      const execPath = await Deno.makeTempFile({ dir: "/tmp/procon" });
      const result =
        await $`g++ -std=gnu++17 -Wall -Wextra -DLOCAL -O2 ${sourcePath} -o ${execPath}`
          .quiet();
      if (result.code !== 0) {
        throw Error("Conpile Fault");
      }
      return [execPath];
    },
    submitPre: async (sourcePath: string) => {
      await $.fs.ensureDir("/tmp/procon");
      const tmpPath = await Deno.makeTempFile({
        dir: "/tmp/procon",
        suffix: ".cpp",
      });
      await Deno.copyFile(sourcePath, tmpPath);
      const submitFile = Deno.makeTempFileSync({
        dir: "/tmp/procon",
        suffix: ".cpp",
      });
      const bundled = await $`oj-bundle ${tmpPath}`.cwd(libPath).quiet("stderr")
        .bytes();
      await Deno.writeFile(submitFile, bundled);
      return submitFile;
    },
  },
};
