import { BaseSource } from "jsr:@shougo/ddu-vim@9/source";
import { Item } from "jsr:@shougo/ddu-vim@9/types";
import { GatherArguments } from "jsr:@shougo/ddu-vim@9/source";
import { ActionData } from "jsr:@shougo/ddu-kind-word@0.4";

type Params = {
  cmd: string;
};

export class Source extends BaseSource<Params> {
  override kind = "cliphist";

  override gather(
    args: GatherArguments<Params>,
  ): ReadableStream<Item<ActionData>[]> {
    const cmd = args.sourceParams.cmd;
    console.log(cmd);
    return new ReadableStream({
      start(controller) {
        controller.enqueue(
          (new TextDecoder().decode(
            new Deno.Command(cmd, { args: ["list"] }).outputSync().stdout,
          )).split("\n").map((word) => {
            return {
              word,
              display: word.split("\t")[1],
            };
          }),
        );
        controller.close();
      },
    });
  }

  override params(): Params {
    return { cmd: "" };
  }
}
