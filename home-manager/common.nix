{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bat
    deno
    fd
    ghq
    github-copilot-cli
    jq
    ripgrep
    trash-cli
    tree
  ];

  home.file = {
    ".latexmkrc".source = ../latexmkrc;
  };

  xdg.enable = true;
  xdg.configFile = {
    "efm-langserver".source = ../config/efm-langserver;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
