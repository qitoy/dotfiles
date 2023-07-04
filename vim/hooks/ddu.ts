import { BaseConfig } from "https://deno.land/x/ddu_vim@v3.2.7/types.ts";
import { ConfigArguments } from "https://deno.land/x/ddu_vim@v3.2.7/base/config.ts";
import { Denops, fn } from "https://deno.land/x/ddu_vim@v3.2.7/deps.ts";

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
        mr: {
          converters: ["converter_hl_dir"],
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
