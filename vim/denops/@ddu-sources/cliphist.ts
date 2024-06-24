import { BaseSource, Item } from "https://deno.land/x/ddu_vim@v4.1.1/types.ts";
import { fn } from "https://deno.land/x/ddu_vim@v4.1.1/deps.ts";
import {
  OnInitArguments,
} from "https://deno.land/x/ddu_vim@v4.1.1/base/source.ts";
import { ActionData } from "https://deno.land/x/ddu_kind_word@v0.2.1/word.ts";

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
      stdout.split("\n").map((word) => {
        const output = new Deno.Command(cmd, { args: ["decode", word] })
          .output();
        return output.then((output) => {
          return { word, text: new TextDecoder().decode(output.stdout) };
        });
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
