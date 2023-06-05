import {
  BaseConfig,
  ContextBuilder,
} from "https://deno.land/x/ddu_vim@v3.0.0/types.ts";
import { Denops } from "https://deno.land/x/ddu_vim@v3.0.0/deps.ts";

export class Config extends BaseConfig {
  // deno-lint-ignore require-await
  override async config(args: {
    denops: Denops;
    contextBuilder: ContextBuilder;
  }): Promise<void> {
    args.contextBuilder.patchGlobal({
      ui: "ff",
      sourceOptions: {
        _: {
          matchers: ["matcher_fzf"],
          sorters: ["sorter_fzf"],
        },
        file: {
          columns: ["filename"],
        },
      },
      sourceParams: {
        mr: {
          kind: "mrw",
        },
      },
      kindOptions: {
        file: {
          defaultAction: "open",
        },
        help: {
          defaultAction: "open",
        },
        action: {
          defaultAction: "do",
        },
      },
      actionOptions: {
        narrow: {
          quit: false,
        },
      },
      uiParams: {
        ff: {
          split: "horizontal",
          previewSplit: "horizontal",
          autoAction: {
            name: "preview",
            previewCmds: [
              "bat",
              "-n",
              "%s",
              "-r",
              "%b:%e",
              "--highlight-line",
              "%l",
            ],
          },
        },
        filer: {
          split: "no",
          sort: "filename",
          sortTreesFirst: true,
        },
      },
    });
  }
}
