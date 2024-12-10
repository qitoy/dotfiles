{ pkgs, sources }: {
  plugins = [
    {
      name = "nvim-treesitter";
      path =
        let
          ts = pkgs.vimPlugins.nvim-treesitter;
          tree-sitter-satysfi = pkgs.neovimUtils.grammarToPlugin (pkgs.tree-sitter.buildGrammar {
            language = "satysfi";
            inherit (sources.tree-sitter-satysfi) version src;
          });
          ts-all = pkgs.symlinkJoin {
            name = "ts-all";
            paths = [ ts tree-sitter-satysfi ] ++ ts.withAllGrammars.dependencies;
          };
        in
        "${ts-all}";
    }
  ];
}
