import { fn, is, u } from "../deps.ts";
import { BaseSource, Item } from "https://deno.land/x/ddu_vim@v4.1.1/types.ts";
import {
  OnInitArguments,
} from "https://deno.land/x/ddu_vim@v4.1.1/base/source.ts";
import { ActionData } from "https://raw.githubusercontent.com/4513ECHO/ddu-kind-url/main/denops/%40ddu-kinds/url.ts";
import { parse } from "jsr:@std/jsonc";

type Params = Record<never, never>;

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
  exec_time: is.String,
  memory: is.String,
  detail: is.String,
});

type Summary = u.PredicateType<typeof isSummary>;

export class Source extends BaseSource<Params> {
  override kind = "url";

  #summary: Summary[] = [];

  override async onInit(args: OnInitArguments<Params>) {
    const cmd = await fn.exepath(args.denops, "cargo");
    const stdout = new TextDecoder().decode(
      new Deno.Command(cmd, {
        args: ["compete", "retrieve", "submission-summaries"],
      }).outputSync().stdout,
    );
    this.#summary = u.ensure(
      parse(stdout),
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
    return {};
  }
}
