{
  config,
  pkgs,
  sources,
  neovim-nightly-overlay,
}:
{
  home.file =
    let
      base = ".cache/dpp/_generated";
    in
    pkgs.lib.attrsets.foldlAttrs (
      acc: name: drv:
      acc // { "${base}/${name}".source = drv; }
    ) { } (import ./plugins.nix { inherit pkgs sources; });
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
      # vim-language-server # error with fixupPhase
      python3Packages.python-lsp-server
      clang-tools
      texlab
      zathura
    ];
    defaultEditor = true;
  };

}
