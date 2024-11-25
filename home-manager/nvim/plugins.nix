{ pkgs, qitoypkgs }: {
  plugins = [
    {
      name = "nvim-treesitter";
      path =
        let
          ts = pkgs.vimPlugins.nvim-treesitter;
          ts-all = pkgs.stdenv.mkDerivation {
            name = "ts-all";
            srcs = [ ts (pkgs.neovimUtils.grammarToPlugin qitoypkgs.tree-sitter-satysfi) ] ++ ts.withAllGrammars.dependencies;
            sourceRoot = ".";
            installPhase = ''
              mkdir -p $out
              cp -R */* $out
            '';
          };
        in
        "${ts-all}";
    }
  ];
}
