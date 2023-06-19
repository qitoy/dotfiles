import { BaseConfig } from "https://deno.land/x/ddu_vim@v3.0.2/types.ts";
import { ConfigArguments } from "https://deno.land/x/ddu_vim@v3.0.2/base/config.ts";
import { Denops, fn } from "https://deno.land/x/ddu_vim@v3.0.2/deps.ts";

export class Config extends BaseConfig {
  // deno-lint-ignore require-await
  override async config(args: ConfigArguments): Promise<void> {
    args.contextBuilder.patchGlobal({
      ui: "ff",
      sourceOptions: {
        _: {
          ignoreCase: true,
          matchers: ["matcher_substring"],
        },
        file: {
          columns: ["filename"],
        },
        cargo_compete: {
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
        lsp: {
          defaultAction: "open",
        },
        lsp_codeAction: {
          defaultAction: "apply",
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
          onPreview: async (args: {
            denops: Denops;
            previewWinId: number;
          }) => {
            await fn.win_execute(args.denops, args.previewWinId, "normal! zt");
          },
        },
        filer: {
          split: "no",
          sort: "filename",
          sortTreesFirst: true,
        },
      },
      filterParams: {
        matcher_substring: {
          highlightMatched: "Search",
        },
      },
    });
  }
}
