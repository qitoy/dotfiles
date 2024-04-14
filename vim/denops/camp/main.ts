import {
  $,
  batch,
  buffer,
  Denops,
  fn,
  is,
  stdPath,
  systemopen,
  u,
} from "../deps.ts";

export function main(denops: Denops): void {
  denops.dispatcher = {
    async campOpen(): Promise<void> {
      try {
        await competeOpen(await currentFullPath(denops));
      } catch {
        console.error("invalid problem page");
      }
    },

    async campRun(): Promise<void> {
      const path = await currentFullPath(denops);
      const { dir, name } = stdPath.parse(path);
      const contest = stdPath.basename(stdPath.resolve(dir, "../../"));
      denops.call("deol#start", {
        command: ["cargo", "run", "--bin", `${contest}-${name}`],
        cwd: dir,
        split: "split",
      });
    },

    async campTest(): Promise<void> {
      const [_, output] = await competeTest(await currentFullPath(denops));
      await campWrite(denops, "test", output);
    },

    async campSubmit(force: unknown): Promise<void> {
      u.assert(force, is.Number);
      const source = await currentFullPath(denops);
      if (!force) {
        const [success, output] = await competeTest(source);
        if (!success) {
          await campWrite(denops, "test", output);
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

async function campWrite(
  denops: Denops,
  name: string,
  content: string[],
): Promise<void> {
  const filename = `camp://${name}`;
  const [winid, bufwinid] = await batch.collect(denops, (denops) => [
    fn.win_getid(denops),
    fn.bufwinid(denops, filename),
  ]);
  if (bufwinid == -1) {
    await buffer.open(denops, filename, {
      opener: "split",
    });
  }
  const bufnr = await fn.bufnr(denops, filename);
  await batch.batch(denops, async (denops) => {
    await buffer.replace(denops, bufnr, content);
    await buffer.concrete(denops, bufnr);
    await fn.win_gotoid(denops, winid);
  });
}

async function currentFullPath(denops: Denops): Promise<string> {
  return await fn.expand(denops, "%:p") as string;
}

async function competeOpen(source: string): Promise<void> {
  const { dir, name } = stdPath.parse(source);
  await $`cargo compete open --bin ${name}`
    .cwd(dir)
    .quiet();
}

async function competeTest(source: string): Promise<[boolean, string[]]> {
  const { dir, name } = stdPath.parse(source);
  const { code, combined } = await $`cargo compete test ${name}`
    .captureCombined()
    .cwd(dir)
    .noThrow()
    .spawn();
  return [code === 0, combined.split("\n")];
}

async function competeSubmit(source: string): Promise<string> {
  const { dir, name } = stdPath.parse(source);
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
