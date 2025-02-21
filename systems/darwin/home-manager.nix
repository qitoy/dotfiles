{ pkgs, username, ... }:
{
  home.username = username;
  home.homeDirectory = "/Users/${username}";

  home.stateVersion = "24.11";

  nixpkgs.config.allowUnfree = true;

  imports = [
    ../../home-manager/zsh
    ../../home-manager/terminal
    ../../home-manager/fonts.nix
    ../../home-manager/compe
    ../../home-manager/nvim
    ../../home-manager/git.nix
  ];

  home.packages = with pkgs; [
    bat
    deno
    ghq
    ripgrep
    tree
    trash-cli
    texliveFull

    rustup

    vivaldi
  ];

  home.file = {
    ".latexmkrc".source = ../../latexmkrc;
  };

  xdg.configFile = {
    "efm-langserver".source = ../../config/efm-langserver;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
