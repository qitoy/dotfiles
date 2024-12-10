{ pkgs, neovim-nightly-overlay, overlays ? [ ], config, ... }:
let
  sources = pkgs.callPackage ../_sources/generated.nix { };
in
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

  nixpkgs = {
    inherit overlays;
    config.allowUnfree = true;
  };

  imports = [
    ./zsh
    ./hypr
    ./terminal
    (import ./fonts.nix { inherit pkgs sources; })
    (import ./compe { inherit pkgs sources; })
    (import ./nvim { inherit config pkgs sources neovim-nightly-overlay; })
    ./git.nix
  ];

  home.packages = with pkgs; [
    # command
    bat
    deno
    ffmpeg
    brightnessctl
    imagemagick
    ghostscript
    ghq
    ripgrep
    fd
    jq
    tree
    vhs
    texliveFull

    ## rust
    rustup
    cargo-udeps

    # gui
    xfce.thunar
    libreoffice
    kolourpaint
    vivaldi
  ];

  home.file = {
    ".latexmkrc".source = ../latexmkrc;
  };

  xdg.configFile = {
    "efm-langserver".source = ../config/efm-langserver;
  };

  home.sessionVariables = { };

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    name = "macOS";
    package = pkgs.apple-cursor;
    size = 22;
  };
  gtk.enable = true;

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.opam.enable = true;

  programs.imv.enable = true;

  services.cliphist.enable = true;
}
