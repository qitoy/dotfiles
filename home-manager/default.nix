{ pkgs, inputs, ... }:

{
  home.username = "qitoy";
  home.homeDirectory = "/home/qitoy";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  fonts.fontconfig.enable = true;

  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  nixpkgs.overlays = [
    inputs.neovim-nightly-overlay.overlays.default
    inputs.qitoy.overlays.default
  ];

  imports = [
    ./zsh
    ./hypr
    ./terminal
  ];

  home.packages = with pkgs; [
    # command
    bat
    deno
    ffmpeg
    chafa
    brightnessctl
    imagemagick
    ghostscript
    ghq
    opam
    ripgrep
    fd
    jq
    tree

    ## rust
    rustup
    cargo-udeps
    cargo-compete
    cargo-equip

    ## python
    python312Packages.online-judge-tools
    python312Packages.online-judge-api-client
    online-judge-verify-helper

    # gui
    xfce.thunar
    libreoffice

    # font
    moralerspace-nf
    twemoji-color-font
    noto-fonts
  ];

  home.file = { };
  home.sessionVariables = { };

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    name = "macOS-Monterey";
    package = pkgs.apple-cursor;
    size = 22;
  };
  gtk.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.neovim = {
    enable = true;
    package = pkgs.neovim; # for neovim nightly
    extraPackages = with pkgs; [
      nixd
      nixpkgs-fmt
      vim-language-server
      python312Packages.python-lsp-server
      clang-tools
    ];
    defaultEditor = true;
  };

  programs.direnv.enable = true;

  programs.git = {
    enable = true;
    aliases = {
      browse = "!deno run --allow-net --allow-run --allow-read --allow-env jsr:@lambdalisue/git-browse/cli";
    };
    ignores = [
      "*.DS_Store"
      "*.swp"
      "*.netrwhist"
      "*.out"
      "*.gch"
      "*.satysfi-aux"
    ];
  };

  services.cliphist.enable = true;
}
