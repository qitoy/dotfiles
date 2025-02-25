{ pkgs, ... }:
{
  fonts.fontconfig.enable = true;
  home.packages = [
    pkgs.moralerspace-nf
    pkgs.twemoji-color-font
    pkgs.noto-fonts-cjk-sans
    pkgs.noto-fonts
  ];
}
