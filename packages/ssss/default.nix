{ stdenv, source, ncurses, lib }: stdenv.mkDerivation {
  inherit (source) pname version src;

  nativeBuildInputs = [ ncurses ];

  buildPhase = ''
  gcc -Wall -O2 -I ${ncurses}/include -L ${ncurses}/lib -o ssss -l ncurses ssss.c
  '';

  installPhase = ''
  mkdir -p $out/bin
  cp ssss $out/bin
  '';

  passthru = { runnable = true; };

  meta = with lib; {
    description = "Soreha So Screensaver";
    homepage = "https://github.com/vm-xeck/ssss";
    license = licenses.wtfpl;
    platforms = platforms.all;
  };
}
