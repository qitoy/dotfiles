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
  vivaldi =
    (prev.vivaldi.overrideAttrs (old: rec {
      version = "7.0.3495.29";
      src = prev.fetchurl {
        url = "https://downloads.vivaldi.com/stable/vivaldi-stable_${version}-1_arm64.deb";
        hash = "sha256-GdywFoaxx2VSpOJ0FJIhFcIRDJEhozCWvYvdatmEi5o=";
      };
    })).override
      {
        proprietaryCodecs = true;
        inherit vivaldi-ffmpeg-codecs;
      };
}
