import { BaseSource, Item } from "jsr:@shougo/ddu-vim@5/types";
import * as fn from "jsr:@denops/std@7/function";
import { OnInitArguments } from "jsr:@shougo/ddu-vim@5/source";
import { ActionData } from "jsr:@shougo/ddu-kind-word@0.3";

type Params = Record<never, never>;

type History = {
  word: string;
  text: string;
};

export class Source extends BaseSource<Params> {
  override kind = "word";

  #history: History[] = [];

  override async onInit(args: OnInitArguments<Params>) {
    const cmd = await fn.exepath(args.denops, "cliphist");
    const stdout = new TextDecoder().decode(
      new Deno.Command(cmd, { args: ["list"] }).outputSync().stdout,
    );
    this.#history = await Promise.all(
      stdout.split("\n").map(async (word) => {
        const output = await new Deno.Command(cmd, { args: ["decode", word] })
          .output();
        return { word, text: new TextDecoder().decode(output.stdout) };
      }),
    );
  }

  override gather(): ReadableStream<Item<ActionData>[]> {
    const history = this.#history;
    return new ReadableStream({
      start(controller) {
        controller.enqueue(history.map(
          ({ word, text }) => {
            return {
              word,
              display: word.split("\t")[1],
              action: {
                text,
              },
            };
          },
        ));
        controller.close();
      },
    });
  }

  override params(): Params {
    return {};
  }
}
