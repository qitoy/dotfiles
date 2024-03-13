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

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
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
    pkgs.bat
    pkgs.deno
    pkgs.rustup
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
  };

  programs.go.enable = true;
  programs.powerline-go = {
    enable = true;
    modules = [
      "host"
      "ssh"
      "cwd"
      "gitlite"
      "jobs"
      "exit"
    ];
    newline = true;
  };

  programs.zsh = {
    defaultKeymap = "emacs";
    dotDir = ".config/zsh";
    enable = true;
    envExtra = ''
      if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then
        . ~/.nix-profile/etc/profile.d/nix.sh
        export EDITOR=nvim
      fi
    '';
  };

  programs.foot = {
    enable = true;
    server.enable = true;
    settings = {
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
