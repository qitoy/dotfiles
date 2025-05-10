import {
  BaseConfig,
  ConfigArguments,
  ConfigReturn,
} from "jsr:@shougo/dpp-vim@4/config";
import { ExtOptions, Plugin } from "jsr:@shougo/dpp-vim@4/types";
import { mergeFtplugins } from "jsr:@shougo/dpp-vim@4/utils";

import {
  Ext as LazyExt,
  LazyMakeStateResult,
  Params as LazyParams,
} from "jsr:@shougo/dpp-ext-lazy@1";
import {
  Ext as TomlExt,
  Params as TomlParams,
  Toml,
} from "jsr:@shougo/dpp-ext-toml@1";
import {
  Ext as LocalExt,
  Params as LocalParams,
} from "jsr:@shougo/dpp-ext-local@1";

import * as fn from "jsr:@denops/std@7/function";

export class Config extends BaseConfig {
  override async config(args: ConfigArguments): Promise<ConfigReturn> {
    // setting inline_vimrcs
    const inlineVimrcs = [
      "$VIM_DIR/settings.vim",
      "$VIM_DIR/mappings.vim",
      "$VIM_DIR/ftrc.vim",
      "$VIM_DIR/nvim.lua",
    ];

    args.contextBuilder.setGlobal({
      inlineVimrcs,
      extParams: {
        installer: {
          checkDiff: true,
          maxProcesses: 5,
        },
      },
      protocols: ["git"],
    });

    const [context, options] = await args.contextBuilder.get(args.denops);
    const protocols = await args.dpp.getProtocols(args.denops, options);

    const recordPlugins: Record<string, Plugin> = {};
    const ftplugins: Record<string, string> = {};
    const hooksFiles: string[] = [];

    const [tomlExt, tomlOptions, tomlParams] = await args.dpp.getExt(
      args.denops,
      options,
      "toml",
    ) as [TomlExt | undefined, ExtOptions, TomlParams];

    if (tomlExt) {
      const tomlLoad = tomlExt.actions["load"];

      const tomls = await Promise.all(
        [
          { path: "$VIM_DPP/dpp.toml", lazy: false },
          { path: "$VIM_DPP/dpp_lazy.toml", lazy: true },
          { path: "$VIM_DPP/ddc.toml", lazy: true },
          { path: "$VIM_DPP/ddu.toml", lazy: true },
          { path: "$VIM_DPP/nvim.toml", lazy: true },
        ].map((toml) =>
          tomlLoad.callback({
            denops: args.denops,
            context,
            options,
            protocols,
            extOptions: tomlOptions,
            extParams: tomlParams,
            actionParams: {
              path: toml.path,
              options: {
                lazy: toml.lazy,
              },
            },
          })
        ),
      ) as (Toml | undefined)[];

      // merge result
      for (const toml of tomls) {
        if (!toml) {
          continue;
        }

        for (const plugin of toml.plugins ?? []) {
          recordPlugins[plugin.name] = plugin;
        }

        if (toml.ftplugins) {
          mergeFtplugins(ftplugins, toml.ftplugins);
        }

        if (toml.hooks_file) {
          hooksFiles.push(toml.hooks_file);
        }
      }
    }

    const [localExt, localOptions, localParams] = await args.dpp.getExt(
      args.denops,
      options,
      "local",
    ) as [LocalExt | undefined, ExtOptions, LocalParams];
    if (localExt) {
      const local = localExt.actions.local;

      const localPlugins = await local.callback({
        denops: args.denops,
        context,
        options,
        protocols,
        extOptions: localOptions,
        extParams: localParams,
        actionParams: {
          directory: "~/.cache/dpp/_generated",
        },
      });

      for (const plugin of localPlugins) {
        if (plugin.name in recordPlugins) {
          Object.assign(recordPlugins[plugin.name], plugin);
        } else {
          recordPlugins[plugin.name] = plugin;
        }
      }
    }

    const [lazyExt, lazyOptions, lazyParams] = await args.dpp.getExt(
      args.denops,
      options,
      "lazy",
    ) as [LazyExt | undefined, ExtOptions, LazyParams];

    let lazyResult: LazyMakeStateResult | undefined = undefined;

    if (lazyExt) {
      const makeState = lazyExt.actions["makeState"];

      lazyResult = await makeState.callback({
        denops: args.denops,
        context,
        options,
        protocols,
        extOptions: lazyOptions,
        extParams: lazyParams,
        actionParams: {
          plugins: Object.values(recordPlugins),
        },
      }) as LazyMakeStateResult;
    }

    // $VIM_DIR/*.vim
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
