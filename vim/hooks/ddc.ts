import {
  BaseConfig,
  ContextBuilder,
} from "https://deno.land/x/ddc_vim@v3.5.0/types.ts";
import { Denops, fn } from "https://deno.land/x/ddc_vim@v3.5.0/deps.ts";

export class Config extends BaseConfig {
  override async config(args: {
    denops: Denops;
    contextBuilder: ContextBuilder;
  }): Promise<void> {
    const hasNvim = await fn.has(args.denops, "nvim");

    args.contextBuilder.patchGlobal({
      ui: "pum",
      sources: [
        hasNvim ? "nvim-lsp" : "vim-lsp",
        "around",
        "ultisnips",
      ],
      cmdlineSources: [
        "cmdline",
        "cmdline-history",
        "around",
      ],
      sourceOptions: {
        _: {
          ignoreCase: true,
          matchers: ["matcher_fuzzy"],
          sorters: ["sorter_fuzzy"],
          converters: ["converter_fuzzy"],
        },
        "vim-lsp": {
          mark: "| LSP",
          forceCompletionPattern: '(\\.|:|->|"\\w+/*).?',
        },
        "nvim-lsp": {
          mark: "| LSP",
          forceCompletionPattern: '(\\.|:|->|"\\w+/*).?',
        },
        ultisnips: {
          mark: "| US",
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
      filterParams: {
        converter_fuzzy: {
          hlGroup: "CursorLine",
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
      sources: ["necovim", "around", "ultisnips"],
    });

    args.contextBuilder.patchFiletype("lua", {
      sources: ["nvim-lua", "around", "ultisnips"],
    });

    args.contextBuilder.patchFiletype("satysfi", {
      keywordPattern: "(\\w|-)*",
    });

    args.contextBuilder.patchFiletype("deol", {
      specialBufferCompletion: true,
      keywordPattern: "[0-9a-zA-Z_./#:-]*",
      sources: ["zsh", "shell-history", "around"],
    });
  }
}