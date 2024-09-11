{ stdenv, source, unzip, lib }: stdenv.mkDerivation rec{
  inherit (source) pname version src;

  nativeBuildInputs = [ unzip ];

  installPhase = ''
    runHook preInstall
    unzip $src
    install -Dm644 *.ttf -t $out/share/fonts/${pname}
    runHook postInstall
  '';

  meta = with lib; {
    description = "欧文フォント Monaspace と日本語フォント IBM Plex Sans JP などを合成したプログラミング向けフォントです。";
    homepage = "https://github.com/yuru7/moralerspace";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
