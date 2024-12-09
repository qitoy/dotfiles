final: prev:
let
  qitoypkgs = final.callPackage ../../packages { };
in
{
  vivaldi = prev.vivaldi.override {
    proprietaryCodecs = true;
    vivaldi-ffmpeg-codecs = qitoypkgs.vivaldi-ffmpeg-codecs;
  };
}
