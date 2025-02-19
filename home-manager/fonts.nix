{ pkgs, sources, ... }:
let
  moralerspace-nf = pkgs.stdenv.mkDerivation rec {
    inherit (sources.moralerspace-nf) pname version src;

    nativeBuildInputs = [ pkgs.unzip ];

    installPhase = ''
      install -Dm644 *.ttf -t $out/share/fonts/${pname}
    '';
  };
in
{
  fonts.fontconfig.enable = true;
  home.packages = [
    moralerspace-nf
    pkgs.twemoji-color-font
    pkgs.noto-fonts-cjk-sans
    pkgs.noto-fonts
  ];
}
