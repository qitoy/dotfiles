import { BaseSource } from "jsr:@shougo/ddu-vim@9/source";
import { Item } from "jsr:@shougo/ddu-vim@9/types";
import { ActionData } from "jsr:@shougo/ddu-kind-word@0.4";

type Params = Record<string, never>;

export class Source extends BaseSource<Params> {
  override kind = "word";

  override gather(): ReadableStream<Item<ActionData>[]> {
    return new ReadableStream({
      async start(controller) {
        const items = [];
        for (
          const line of (await Deno.readTextFile("/tmp/vimclip")).split("\n")
        ) {
          if (line === "") {
            continue;
          }
          const word = JSON.parse(line) as string;
          items.push({
            word,
            display: word,
            action: {
              text: word,
            },
          });
        }
        items.reverse();
        controller.enqueue(items);
        controller.close();
      },
    });
  }

  override params(): Params {
    return {};
  }
}
