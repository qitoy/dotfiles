{ config, pkgs, ... }:

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

  nixpkgs.config = {};

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
    rustup
    neofetch
    ffmpeg
    chafa
    jnv
    brightnessctl
    wob
    python312Packages.online-judge-tools
    python312Packages.online-judge-api-client
    imagemagick
    pandoc
    ghq
    hugo
    opam

    # lsp
    nixd

    # gui
    xfce.thunar
    libreoffice

    # font
    udev-gothic
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

  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    }))
  ];

  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;
    defaultEditor = true;
  };

  programs.go.enable = true;
  programs.powerline-go = {
    enable = true;
    newline = true;
  };

  programs.zsh = {
    defaultKeymap = "emacs";
    dotDir = ".config/zsh";
    enable = true;
    envExtra = ''
      if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then
        . ~/.nix-profile/etc/profile.d/nix.sh
      fi
    '';
    initExtra = ''
      zmodload zsh/zpty

      autoload -U select-word-style
      select-word-style bash

      autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
      add-zsh-hook chpwd chpwd_recent_dirs
      zstyle ':chpwd:*' recent-dirs-max 10000

      bindkey "^U" backward-kill-line

      # fzf
      . ${./zsh/fzf-cdr.zsh}
      alias cdr="fzf-cdr"
    '';
    profileExtra = ''
      export PATH="$HOME/.cargo/bin:$PATH"
      export PATH="$HOME/go/bin:$PATH"
    '';
  };

  programs.fzf = {
    enable = true;
    defaultOptions = [
      "--no-sort"
      "--cycle"
      "--multi"
      "--ansi"
    ];
  };

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

  programs.foot = {
    enable = true;
    # server.enable = true;
    settings = {
      main = {
        font = "UDEV Gothic 35LG:size=12.5";
      };
      colors.alpha = 0.85;
    };
  };

  programs.wezterm = {
    # enable = true;
    extraConfig = ''
      local wezterm = require "wezterm"
      local act = wezterm.action

      -- wezterm.on("gui-startup", function()
      --     local tab, pane, window = wezterm.mux.spawn_window{}
      --     window:gui_window():toggle_fullscreen()
      -- end)

      return {
          -- font = wezterm.font("UDEV Gothic 35LG"),
          initial_cols = 100,
          initial_rows = 48,
          use_ime = false,
          font_size = 12.5,
          color_scheme = "carbonfox",
          window_background_opacity = 0.85,
          hide_tab_bar_if_only_one_tab = true,
          window_decorations = "NONE",
          window_padding = {
              left = 0,
              right = 0,
              top = 0,
              bottom = 0,
          },
          default_cursor_style = 'BlinkingBlock',
          keys = {
              { key = '+', mods = 'SUPER', action = act.DisableDefaultAssignment, },
              { key = '+', mods = 'CTRL' , action = act.DisableDefaultAssignment, },
              { key = '-', mods = 'SUPER', action = act.DisableDefaultAssignment, },
              { key = '-', mods = 'CTRL' , action = act.DisableDefaultAssignment, },
              { key = '=', mods = 'SUPER', action = act.DisableDefaultAssignment, },
              { key = '=', mods = 'CTRL' , action = act.DisableDefaultAssignment, },
              { key = '0', mods = 'SUPER', action = act.DisableDefaultAssignment, },
              { key = '0', mods = 'CTRL' , action = act.DisableDefaultAssignment, },
          }
      }
    '';
  };
}
