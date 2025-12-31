{
  pkgs,
  username,
  ...
}:
{
  home.username = username;
  home.homeDirectory = "/home/${username}";
  qitoy.util.user.email = "itmkan@icloud.com";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  imports = [
    ../../home-manager
  ];

  home.packages = with pkgs; [
    # command
    ffmpeg
    brightnessctl
    imagemagick
    ghostscript
    vhs

    ## rust
    rustup
    cargo-udeps

    # gui
    xfce.thunar
    vivaldi
  ];

  home.sessionVariables = { };

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    name = "macOS";
    package = pkgs.apple-cursor;
    size = 22;
  };
  gtk.enable = true;

  programs.opam.enable = true;

  programs.imv.enable = true;

  services.cliphist.enable = true;
}
