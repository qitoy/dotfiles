{
  config,
  pkgs,
  sources,
  inputs,
  ...
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
    package = inputs.neovim-nightly-overlay.packages.${pkgs.stdenv.hostPlatform.system}.default;
    extraPackages = with pkgs; [
      clang-tools
      copilot-language-server
      efm-langserver
      github-copilot-cli
      nixd
      nixfmt-rfc-style
      nodejs
      python3Packages.python-lsp-server
      taplo
      texlab
      vim-language-server # error with fixupPhase
      zathura
    ];
    defaultEditor = true;
  };
}
