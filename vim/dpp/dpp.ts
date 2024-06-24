import {
  BaseConfig,
  ConfigArguments,
  ConfigReturn,
  Plugin,
} from "https://deno.land/x/dpp_vim@v0.3.0/types.ts";
import { fn } from "https://deno.land/x/dpp_vim@v0.3.0/deps.ts";

// dpp-ext-toml
type Toml = {
  hooks_file?: string;
  ftplugins?: Record<string, string>;
  plugins: Plugin[];
};

// dpp-ext-lazy
type LazyMakeStateResult = {
  plugins: Plugin[];
  stateLines: string[];
};

export class Config extends BaseConfig {
  override async config(args: ConfigArguments): Promise<ConfigReturn> {
    // setting inline_vimrcs
    const inlineVimrcs = [
      "$VIM_DIR/settings.vim",
      "$VIM_DIR/mappings.vim",
      "$VIM_DIR/ftrc.vim",
    ];

    args.contextBuilder.setGlobal({
      inlineVimrcs,
      extParams: {
        installer: {
          checkDiff: true,
          maxProcesses: 5,
          githubAPIToken: Deno.env.get("DPP_GITHUB_TOKEN")!,
        },
      },
      protocols: ["git"],
    });

    const [context, options] = await args.contextBuilder.get(args.denops);

    // toml plugins
    const tomls: Toml[] = [];
    // non-lazy
    for (
      const toml of [
        "$VIM_DPP/dpp.toml",
      ]
    ) {
      tomls.push(
        await args.dpp.extAction(
          args.denops,
          context,
          options,
          "toml",
          "load",
          {
            path: toml,
            options: {
              lazy: false,
            },
          },
        ) as Toml,
      );
    }
    // lazy
    for (
      const toml of [
        "$VIM_DPP/dpp_lazy.toml",
        "$VIM_DPP/ddc.toml",
        "$VIM_DPP/ddu.toml",
        "$VIM_DPP/nvim.toml",
      ]
    ) {
      tomls.push(
        await args.dpp.extAction(
          args.denops,
          context,
          options,
          "toml",
          "load",
          {
            path: toml,
            options: {
              lazy: true,
            },
          },
        ) as Toml,
      );
    }

    // merge result
    const recordPlugins: Record<string, Plugin> = {};
    const ftplugins: Record<string, string> = {};
    const hooksFiles: string[] = [];
    for (const toml of tomls) {
      for (const plugin of toml.plugins) {
        recordPlugins[plugin.name] = plugin;
      }

      if (toml.ftplugins) {
        for (const filetype of Object.keys(toml.ftplugins)) {
          if (!ftplugins[filetype]) {
            ftplugins[filetype] = "";
          }
          // ftplugins[filetype] is not undefined
          ftplugins[filetype] += `\n${toml.ftplugins[filetype]}`;
        }
      }

      if (toml.hooks_file) {
        hooksFiles.push(toml.hooks_file);
      }
    }

    const lazyResult = await args.dpp.extAction(
      args.denops,
      context,
      options,
      "lazy",
      "makeState",
      {
        plugins: Object.values(recordPlugins),
      },
    ) as LazyMakeStateResult | undefined;

    // $VIM_DIR/init.vim
    // $VIM_DIR/settings.vim
    // $VIM_DPP/*,
    const checkFiles: string[] = [
      ...await fn.globpath(
        args.denops,
        "$VIM_DIR",
        "*.vim",
        1,
        1,
      ) as unknown as string[],
      ...await fn.globpath(
        args.denops,
        "$VIM_DPP",
        "*",
        1,
        1,
      ) as unknown as string[],
    ];

    return {
      checkFiles,
      ftplugins,
      hooksFiles,
      plugins: lazyResult?.plugins ?? [],
      stateLines: lazyResult?.stateLines ?? [],
    };
  }
}
