{ pkgs, sources }:
{
  nvim-treesitter =
    let
      ts = pkgs.vimPlugins.nvim-treesitter;
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
        ts
        tree-sitter-satysfi
      ] ++ ts.withAllGrammars.dependencies;
    };

  skk-dict = pkgs.skkDictionaries.l;

  "avante.nvim" = pkgs.vimPlugins.avante-nvim;
}
