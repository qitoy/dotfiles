import { BaseConfig } from "https://deno.land/x/ddc_vim@v4.0.4/types.ts";
import { ConfigArguments } from "https://deno.land/x/ddc_vim@v4.0.4/base/config.ts";

export class Config extends BaseConfig {
  // deno-lint-ignore require-await
  override async config(args: ConfigArguments): Promise<void> {
    args.setAlias("source", "zsh", "shell-native");

    args.contextBuilder.patchGlobal({
      ui: "pum",
      sources: [
        "lsp",
        "denippet",
        "around",
      ],
      cmdlineSources: {
        ":": ["cmdline", "cmdline-history", "around"],
      },
      sourceOptions: {
        _: {
          ignoreCase: true,
          matchers: ["matcher_fuzzy"],
          sorters: ["sorter_fuzzy"],
          converters: ["converter_fuzzy"],
        },
        lsp: {
          mark: "| LSP",
          forceCompletionPattern: '(\\.|:|->|"\\w+/*).?',
          converters: ["converter_kind_labels"],
          // sorters: ["sorter_lsp-kind"],
        },
        denippet: {
          mark: "| snippet",
        },
        around: {
          mark: "| A",
        },
        "nvim-lua": { mark: "| lua" },
        mocword: {
          mark: "| mocword",
          minAutoCompleteLength: 3,
          isVolatile: true,
        },
        cmdline: {
          ignoreCase: false,
          mark: "| cmd",
          forceCompletionPattern: "\\S/\\S*",
        },
        "cmdline-history": {
          mark: "| history",
        },
        zsh: {
          mark: "| zsh",
        },
        "shell-history": {
          mark: "| shell",
        },
      },
      sourceParams: {
        lsp: {
          lspEngine: "nvim-lsp",
          enableResolveItem: true,
          enableAdditionalTextEdit: true,
          confirmBehavior: "replace",
          snippetEngine: async (body: string) => {
            await args.denops.call("denippet#anonymous", body);
          },
        },
        zsh: {
          shell: "zsh",
        },
        converter_kind_labels: {
          kindLabels: {
            Class: "c",
          },
        },
      },
      filterParams: {
        converter_fuzzy: {
          hlGroup: "CursorLine",
        },
        "sorter_lsp-kind": {
          priority: [
            ["Keyword", "Snippet"],
            "Enum",
            ["Method", "Function"],
            "Field",
            "Variable",
          ],
        },
      },
      autoCompleteEvents: [
        "InsertEnter",
        "TextChangedI",
        "TextChangedP",
        "CmdlineEnter",
        "CmdlineChanged",
        "TextChangedT",
      ],
    });

    args.contextBuilder.patchFiletype("vim", {
      sources: ["necovim", "around", "denippet"],
    });

    args.contextBuilder.patchFiletype("lua", {
      sources: ["nvim-lua", "around", "denippet"],
    });

    args.contextBuilder.patchFiletype("satysfi", {
      sourceOptions: {
        _: {
          keywordPattern: "(\\w|-)*",
        },
      },
    });

    args.contextBuilder.patchFiletype("deol", {
      specialBufferCompletion: true,
      sourceOptions: {
        _: {
          keywordPattern: "[0-9a-zA-Z_./#:-]*",
        },
      },
      sources: ["zsh", "shell-history", "around"],
    });
  }
}
