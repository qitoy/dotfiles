import {
  type ActionArguments,
  ActionFlags,
} from "jsr:@shougo/ddu-vim@10/types";
import {
  BaseConfig,
  type ConfigArguments,
} from "jsr:@shougo/ddu-vim@10/config";
import type { ActionData as FileAction } from "jsr:@shougo/ddu-kind-file@0.9";
import type { Params as FFParams } from "jsr:@shougo/ddu-ui-ff@2";
import type { Params as FilerParams } from "jsr:@shougo/ddu-ui-filer@2";
import * as fn from "jsr:@denops/std@7/function";

type Params = Record<string, unknown>;

export class Config extends BaseConfig {
  override async config(args: ConfigArguments): Promise<void> {
    args.setAlias("_", "source", "file_git", "file_external");
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
        file_git: {
          cmd: ["git", "ls-files", "-co", "--exclude-standard"],
        },
        mr: {
          kind: "mrw",
        },
        rg: {
          args: ["--column", "--no-heading", "--json"],
        },
        cliphist: {
          cmd: await fn.exepath(args.denops, "cliphist"),
        },
      },

      kindOptions: {
        file: {
          defaultAction: "open",
          actions: {
            filer: {
              description: "start ddu-ui-filer from the path.",
              callback: async (args: ActionArguments<Params>) => {
                const action = args.items[0]?.action as FileAction;

                await args.denops.call("ddu#start", {
                  ui: "filer",
                  name: args.options.name,
                  sources: [
                    {
                      name: "file",
                      options: {
                        path: action.path,
                      },
                    },
                  ],
                });

                return Promise.resolve(ActionFlags.None);
              },
            },
            grep: {
              description: "Grep from the path.",
              callback: async (args: ActionArguments<Params>) => {
                const paths = [];
                for (const item of args.items) {
                  paths.push((item?.action as FileAction).path);
                }
                await args.denops.call("ddu#start", {
                  name: args.options.name,
                  ui: {
                    name: "ff",
                    params: {
                      startAutoAction: true,
                    },
                  },
                  // push: true,
                  sources: [
                    {
                      name: "rg",
                      params: {
                        paths,
                        input: await fn.input(args.denops, "Pattern: "),
                      },
                    },
                  ],
                });

                return Promise.resolve(ActionFlags.None);
              },
            },
          },
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
        cliphist: {
          defaultAction: "append",
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
  }
}
