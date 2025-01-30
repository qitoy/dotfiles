import {
  type ActionArguments,
  DduItem,
} from "jsr:@shougo/ddu-vim@~6.1.0/types";
import { BaseKind } from "jsr:@shougo/ddu-vim@~6.1.0/kind";
import { WordActions } from "jsr:@shougo/ddu-kind-word@0.4";
import { assert } from "jsr:@std/assert@1";

type Params = Record<string, never>;

export class Kind extends BaseKind<Params> {
  override actions = {
    append: (args: ActionArguments<Params>) => {
      const items = decode_items(args);
      assert(typeof WordActions.append === "object");
      return WordActions.append.callback({ ...args, items });
    },
    insert: (args: ActionArguments<Params>) => {
      const items = decode_items(args);
      assert(typeof WordActions.insert === "object");
      return WordActions.insert.callback({ ...args, items });
    },
  };

  override params(): Params {
    return {};
  }
}

function decode_items(
  { sourceParams, items }: ActionArguments<Params>,
): DduItem[] {
  const cmd = sourceParams.cmd as string;
  return items.map((item) => {
    return {
      ...item,
      action: {
        text: new TextDecoder().decode(
          new Deno.Command(cmd, { args: ["decode", item.word] })
            .outputSync().stdout,
        ),
      },
    };
  });
}
