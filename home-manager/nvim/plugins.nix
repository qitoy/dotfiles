{ pkgs, qitoypkgs }: {
  plugins = [
    {
      name = "nvim-treesitter";
      path =
        let
          ts = pkgs.vimPlugins.nvim-treesitter;
          ts-all = pkgs.symlinkJoin {
            name = "ts-all";
            paths = [ ts (pkgs.neovimUtils.grammarToPlugin qitoypkgs.tree-sitter-satysfi) ] ++ ts.withAllGrammars.dependencies;
          };
        in
        "${ts-all}";
    }
  ];
}
