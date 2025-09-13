{ pkgs, sources }:
{
  nvim-treesitter =
    let
      nvim-treesitter-main = pkgs.vimUtils.buildVimPlugin {
        inherit (sources.nvim-treesitter-main) pname version src;
        nvimSkipModules = [ "nvim-treesitter._meta.parsers" ];
      };
      tree-sitter-satysfi = pkgs.neovimUtils.grammarToPlugin (
        pkgs.tree-sitter.buildGrammar {
          language = "satysfi";
          inherit (sources.tree-sitter-satysfi) version src;
        }
      );
    in
    pkgs.symlinkJoin {
      name = "ts-all";
      paths = [
        nvim-treesitter-main
        tree-sitter-satysfi
      ]
      ++ pkgs.vimPlugins.nvim-treesitter.withAllGrammars.dependencies;
      postBuild = ''
        cd $out
        mkdir -p ./queries
        mv ./runtime/queries/* ./queries
      '';
    };

  skk-dict = pkgs.skkDictionaries.l;

  "avante.nvim" = pkgs.vimPlugins.avante-nvim;
}
