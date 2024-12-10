{
  config,
  pkgs,
  sources,
  neovim-nightly-overlay,
}:
{
  home.file = {
    ".cache/dpp/_generated.toml".source =
      let
        tomlFormat = pkgs.formats.toml { };
      in
      tomlFormat.generate "_generated.toml" (import ./plugins.nix { inherit pkgs sources; });
  };
  xdg.configFile = {
    "nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/vim";
  };
  programs.neovim = {
    enable = true;
    package = neovim-nightly-overlay.packages.${pkgs.system}.default;
    extraPackages = with pkgs; [
      efm-langserver
      nixd
      nixfmt-rfc-style
      vim-language-server
      python3Packages.python-lsp-server
      clang-tools
      texlab
      zathura
    ];
    defaultEditor = true;
  };

}
