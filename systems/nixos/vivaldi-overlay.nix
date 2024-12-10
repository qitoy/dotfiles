final: prev:
let
  sources = final.callPackage ../../_sources/generated.nix { };
  vivaldi-ffmpeg-codecs = final.stdenv.mkDerivation {
    inherit (sources.vivaldi-ffmpeg-codecs) pname version src;
    buildInputs = [ final.squashfsTools ];
    unpackPhase = ''
      unsquashfs -dest . $src
    '';
    installPhase = ''
      install -vD usr/lib/chromium-browser/libffmpeg.so $out/lib/libffmpeg.so
    '';
  };
in
{
  vivaldi = prev.vivaldi.override {
    proprietaryCodecs = true;
    inherit vivaldi-ffmpeg-codecs;
  };
}
