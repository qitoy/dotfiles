import * as fn from "jsr:@denops/std@7/function";
import * as u from "jsr:@core/unknownutil@4";
import { is } from "jsr:@core/unknownutil@4";
import { BaseSource } from "jsr:@shougo/ddu-vim@9/source";
import { Item } from "jsr:@shougo/ddu-vim@9/types";
import { OnInitArguments } from "jsr:@shougo/ddu-vim@9/source";
import { ActionData } from "jsr:@4513echo/ddu-kind-url@0.7";

type Params = {
  bin_name_or_alias: string;
};

const isSummary = is.ObjectOf({
  submission_time: is.String,
  task: is.ObjectOf({
    display_name: is.String,
    url: is.String,
  }),
  user: is.ObjectOf({
    name: is.String,
    url: is.String,
  }),
  language: is.String,
  score: is.String,
  code_size: is.String,
  status: is.String,
  exec_time: is.UnionOf([is.Null, is.String]),
  memory: is.UnionOf([is.Null, is.String]),
  detail: is.String,
});

type Summary = u.PredicateType<typeof isSummary>;

export class Source extends BaseSource<Params> {
  override kind = "url";

  #summary: Summary[] = [];

  override async onInit(args: OnInitArguments<Params>) {
    const cmd = await fn.exepath(args.denops, "cargo");
    const cmd_args = ["compete", "retrieve", "submission-summaries"];
    if (args.sourceParams.bin_name_or_alias !== "") {
      cmd_args.push(args.sourceParams.bin_name_or_alias);
    }
    const stdout = new TextDecoder().decode(
      new Deno.Command(cmd, {
        args: cmd_args,
      }).outputSync().stdout,
    );
    this.#summary = u.ensure(
      JSON.parse(stdout),
      is.ObjectOf({
        summaries: is.ArrayOf(isSummary),
      }),
    ).summaries;
  }

  override gather(): ReadableStream<Item<ActionData>[]> {
    const summary = this.#summary;
    return new ReadableStream({
      start(controller) {
        controller.enqueue(summary.map(
          ({ task: { display_name }, status, detail }) => {
            return {
              word: `${display_name} | ${status}`,
              action: {
                url: detail,
              },
            };
          },
        ));
        controller.close();
      },
    });
  }

  override params(): Params {
    return {
      bin_name_or_alias: "",
    };
  }
}
