{ python3Packages, source, lib }: python3Packages.buildPythonPackage {
  inherit (source) pname version src;

  doCheck = false;

  meta = with lib; {
    description = "Janome is a Japanese morphological analysis engine written in pure Python.";
    homepage = "https://mocobeta.github.io/janome/en/";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
