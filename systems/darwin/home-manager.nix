{
  pkgs,
  lib,
  username,
  ...
}:
{
  home.username = username;
  home.homeDirectory = lib.mkForce "/Users/${username}";

  home.stateVersion = "24.11";

  imports = [
    ../../home-manager/zsh
    ../../home-manager/terminal
    ../../home-manager/fonts.nix
    ../../home-manager/nvim
    ../../home-manager/git.nix
  ];

  home.packages = with pkgs; [
    bat
    deno
    ghq
    ripgrep
    jq
    tree
    trash-cli
    rustup
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
