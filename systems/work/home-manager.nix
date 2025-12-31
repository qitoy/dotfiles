{
  lib,
  username,
  ...
}:
{
  home.username = username;
  home.homeDirectory = lib.mkForce "/Users/${username}";
  qitoy.util.isWork = true;

  home.stateVersion = "24.11";

  imports = [
    ../../home-manager
  ];
}
