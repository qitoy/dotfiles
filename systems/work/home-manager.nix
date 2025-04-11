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
    ../../home-manager/nvim
    (import ../../home-manager/git.nix {
      userName = username;
      userEmail = "";
    })
  ];

  home.packages = with pkgs; [
    bat
    deno
    ghq
    ripgrep
    jq
    tree
    trash-cli
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
