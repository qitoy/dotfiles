{ stdenv, source, squashfsTools, lib }: stdenv.mkDerivation {
  inherit (source) pname version src;

  buildInputs = [ squashfsTools ];

  unpackPhase = ''
    unsquashfs -dest . $src
  '';

  installPhase = ''
    install -vD usr/lib/chromium-browser/libffmpeg.so $out/lib/libffmpeg.so
  '';

  meta = with lib; {
    platforms = [ "aarch64-linux" ];
  };
}
