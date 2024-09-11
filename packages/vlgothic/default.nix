{ stdenv, source }: stdenv.mkDerivation rec{
  inherit (source) pname version src;

  installPhase = ''
    runHook preInstall
    install -Dm644 *.ttf -t $out/share/fonts/${pname}
    runHook postInstall
  '';
}
