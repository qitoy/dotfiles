import { $ } from "https://deno.land/x/dax@0.35.0/mod.ts";
import { systemopen } from "https://deno.land/x/systemopen@v0.2.0/mod.ts";
import { type Denops } from "https://deno.land/x/denops_std@v5.0.2/mod.ts";
import * as fn from "https://deno.land/x/denops_std@v5.0.2/function/mod.ts";
import { assert, is } from "https://deno.land/x/unknownutil@v3.10.0/mod.ts";

export function main(denops: Denops): void {
  denops.dispatcher = {
    async campOpen(): Promise<void> {
      try {
        await competeOpen(await currentFullPath(denops));
      } catch {
        console.error("invalid problem page");
      }
    },

    async campTest(): Promise<void> {
      const [_, output] = await competeTest(await currentFullPath(denops));
      await denops.call("camp#write", "test", output);
    },

    async campTestJson(): Promise<void> {
      const json = await competeTestJson(await currentFullPath(denops));
      console.log(json);
    },

    async campSubmit(force: unknown): Promise<void> {
      assert(force, is.Number);
      const source = await currentFullPath(denops);
      if (!force) {
        const [success, output] = await competeTest(source);
        if (!success) {
          await denops.call("camp#write", "test", output);
          return;
        }
        if (
          await fn.confirm(denops, "Submit?", "&Yes\n&No", 0, "Question") !== 1
        ) {
          denops.cmd('echo "canceled"');
          return;
        }
      }
      const uri = await competeSubmit(source);
      await systemopen(uri);
    },
  };
}

async function currentFullPath(denops: Denops): Promise<string> {
  return await fn.expand(denops, "%:p") as string;
}

async function competeOpen(source: string): Promise<void> {
  const path = $.path(source);
  const dir = path.dirname();
  // a.rs -> a
  const name = path.basename().slice(0, -3);
  await $`cargo compete open --bin ${name}`
    .cwd(dir)
    .quiet();
}

async function competeTest(source: string): Promise<[boolean, string[]]> {
  const path = $.path(source);
  const dir = path.dirname();
  const name = path.basename().slice(0, -3);
  const { code, combined } = await $`cargo compete test ${name}`
    .captureCombined()
    .cwd(dir)
    .noThrow()
    .spawn();
  return [code === 0, combined.split("\n")];
}

async function competeTestJson(source: string): Promise<any> {
  const path = $.path(source);
  const dir = path.dirname();
  const name = path.basename().slice(0, -3);
  return await $`cargo compete test ${name} --json`
    .quiet("stderr")
    .cwd(dir)
    .noThrow()
    .json();
}

async function competeSubmit(source: string): Promise<string> {
  const path = $.path(source);
  const dir = path.dirname();
  const name = path.basename().slice(0, -3);
  const lines = await $`cargo compete submit ${name} --no-test --no-watch`
    .captureCombined()
    .cwd(dir)
    .noThrow()
    .lines();
  let uri = "";
  for (const line of lines) {
    if (line.includes("URL (detail)")) {
      uri = line.replace(/^.*(https\S+).*$/, "$1");
    }
  }
  return uri;
}
