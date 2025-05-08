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
    ../../home-manager/common.nix
    ../../home-manager/zsh
    ../../home-manager/compe
    ../../home-manager/terminal
    ../../home-manager/fonts.nix
    ../../home-manager/nvim
    (import ../../home-manager/git.nix { })
  ];

  home.packages = with pkgs; [
    rustup
  ];
}
