import { BaseConfig } from "https://deno.land/x/ddu_vim@v4.1.1/types.ts";
import { ConfigArguments } from "https://deno.land/x/ddu_vim@v4.1.1/base/config.ts";
import { Denops, fn } from "https://deno.land/x/ddu_vim@v4.1.1/deps.ts";

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
        rg: {
          args: ['--column', '--no-heading', '--json'],
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
        tab: {
          defaultAction: "open",
        },
        word: {
          defaultAction: "append",
        },
        url: {
          defaultAction: "browse",
        },
      },
      actionOptions: {
        narrow: {
          quit: false,
        },
      },
      uiParams: {
        ff: {
          split: "floating",
          winWidth: "&columns / 2",
          winHeight: "&lines / 2",
          winRow: "&lines - eval(uiParams.winHeight)",
          winCol: 0,
          filterSplitDirection: "floating",
          previewFloating: true,
          previewSplit: "vertical",
          previewWidth: "&columns - eval(uiParams.winWidth)",
          previewHeight: "eval(uiParams.winHeight)",
          previewCol: "eval(uiParams.winWidth)",
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
          startAutoAction: true,
          onPreview: async (args: {
            denops: Denops;
            previewWinId: number;
          }) => {
            await fn.win_execute(args.denops, args.previewWinId, "normal! zt");
          },
        },
        filer: {
          split: "floating",
          sort: "filename",
          winRow: "(&lines - eval(uiParams.winHeight)) / 2",
          winWidth: "&columns - 8",
          winHeight: "&lines - 8",
          floatingBorder: "double",
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
