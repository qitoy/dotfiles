import type { Entrypoint } from "jsr:@denops/core@7";
import * as fn from "jsr:@denops/std@7/function";
import * as u from "jsr:@core/unknownutil@4";
import { is } from "jsr:@core/unknownutil@4";
import * as fs from "jsr:@std/fs@1";
import xdg from "npm:@folder/xdg@4";

export const main: Entrypoint = async (denops) => {
  denops.dispatcher = {
    memo: async (bang, text) => {
      u.assert(bang, is.Number);
      u.assert(text, is.String);
      const [fname, time] = get_fname_time();
      const dataDir = `${xdg().data}/memovim`;
      await fs.ensureDir(dataDir);
      await Deno.writeTextFile(
        `${dataDir}/${fname}.txt`,
        `${bang ? "!" : ""}${time}: ${text}\n`,
        { append: true },
      );
    },
    memoView: async () => {
      const [fname] = get_fname_time();
      const dataDir = `${xdg().data}/memovim`;
      await fs.ensureDir(dataDir);
      const escapedPath = await fn.fnameescape(
        denops,
        `${dataDir}/${fname}.txt`,
      );
      await denops.cmd(`edit ${escapedPath}`);
    },
  };
  await denops.cmd(
    `command! -nargs=1 -bang Memo call denops#notify('${denops.name}', 'memo', [<bang>0, <q-args>])`,
  );
  await denops.cmd(
    `command! MemoView call denops#notify('${denops.name}', 'memoView', [])`,
  );
};

function get_fname_time(): string[] {
  return new Date().toLocaleString("ja-JP", {
    year: "numeric",
    month: "2-digit",
    day: "2-digit",
    hour: "2-digit",
    minute: "2-digit",
    second: "2-digit",
  }).replaceAll("/", "-").split(" ");
}
