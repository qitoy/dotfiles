import type { Entrypoint } from "jsr:@denops/core@7";
import * as u from "jsr:@core/unknownutil@4";
import { is } from "jsr:@core/unknownutil@4";
import * as fs from "jsr:@std/fs@1";
import xdg from "npm:@folder/xdg@4";

export const main: Entrypoint = async (denops) => {
  denops.dispatcher = {
    memo: async (bang, text) => {
      u.assert(bang, is.Number);
      u.assert(text, is.String);
      const [date, time] = new Date().toLocaleString("ja-JP").split(" ");
      const fname = date.replaceAll("/", "-");
      const dataDir = `${xdg().data}/memovim`;
      await fs.ensureDir(dataDir);
      await Deno.writeTextFile(
        `${dataDir}/${fname}.txt`,
        `${bang ? "!" : ""}${time}: ${text}\n`,
        { append: true },
      );
    },
  };
  await denops.cmd(
    `command! -nargs=1 -bang Memo call denops#notify('${denops.name}', 'memo', [<bang>0, <q-args>])`,
  );
};
