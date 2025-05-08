{
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
    ../../home-manager/terminal
    ../../home-manager/nvim
    (import ../../home-manager/git.nix {
      userName = username;
      userEmail = "";
    })
  ];
}
