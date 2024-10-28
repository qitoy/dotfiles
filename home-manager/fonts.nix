{ pkgs, qitoypkgs }: {
  fonts.fontconfig.enable = true;
  home.packages = [
    qitoypkgs.moralerspace-nf
    pkgs.twemoji-color-font
    pkgs.noto-fonts-cjk-sans
    pkgs.noto-fonts
  ];
}
