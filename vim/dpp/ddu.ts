import { BaseConfig, ConfigArguments } from "jsr:@shougo/ddu-vim@9/config";
import { Params as FFParams } from "jsr:@shougo/ddu-ui-ff@1";
import { Params as FilerParams } from "jsr:@shougo/ddu-ui-filer@1";
import * as fn from "jsr:@denops/std@7/function";

export class Config extends BaseConfig {
  override config(args: ConfigArguments): Promise<void> {
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
          args: ["--column", "--no-heading", "--json"],
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
          onPreview: async (args) => {
            await fn.win_execute(args.denops, args.previewWinId, "normal! zt");
          },
        } as Partial<FFParams>,
        filer: {
          split: "floating",
          sort: "filename",
          winRow: "(&lines - eval(uiParams.winHeight)) / 2",
          winWidth: "&columns - 8",
          winHeight: "&lines - 8",
          floatingBorder: "double",
          sortTreesFirst: true,
        } as Partial<FilerParams>,
      },
      filterParams: {
        matcher_substring: {
          highlightMatched: "Search",
        },
      },
    });

    return Promise.resolve();
  }
}
