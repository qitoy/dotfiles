{ pkgs, inputs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
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
    home-manager/zsh.nix
    home-manager/terminal.nix
  ];

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
    # command
    bat
    deno

    ## rust
    rustup
    cargo-udeps
    cargo-compete
    cargo-equip

    ## python
    python312Packages.online-judge-tools
    python312Packages.online-judge-api-client
    online-judge-verify-helper

    ffmpeg
    chafa
    jnv
    brightnessctl
    wob
    imagemagick
    ghostscript
    ghq
    opam
    ripgrep
    fd
    jq

    # gui
    xfce.thunar
    libreoffice
    cliphist

    # font
    udev-gothic-nf
    moralerspace-nf
    twemoji-color-font
    noto-fonts
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/qitoy/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [
      nixd
      nixpkgs-fmt
      vim-language-server
    ];
    defaultEditor = true;
  };

  programs.direnv.enable = true;

  programs.git = {
    enable = true;
    aliases = {
      browse = "!deno run --allow-net --allow-run --allow-read --allow-env https://deno.land/x/git_browse/bin/browse.ts";
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

  programs.wofi = {
    enable = true;
  };
}