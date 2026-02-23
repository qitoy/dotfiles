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
      ]
      ++ (ts.withPlugins (
        p: with p; [
          c
          cpp
          diff
          git_config
          git_rebase
          gitattributes
          gitcommit
          gitignore
          java
          javascript
          json
          json5
          lua
          markdown
          nix
          objc
          python
          rust
          toml
          typescript
          vim
          vimdoc
          yaml
          zsh
        ]
      )).dependencies;
    };

  skk-dict = pkgs.skkDictionaries.l;
}
