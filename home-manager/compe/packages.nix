{ sources, rustPlatform, pkg-config, openssl, python3Packages }: {
  cargo-compete = rustPlatform.buildRustPackage {
    inherit (sources.cargo-compete) pname version src;
    cargoLock.lockFile = sources.cargo-compete.cargoLock."Cargo.lock".lockFile;
    nativeBuildInputs = [ pkg-config ];
    buildInputs = [ openssl ];
    doCheck = false;
  };

  cargo-equip = rustPlatform.buildRustPackage {
    inherit (sources.cargo-equip) pname version src;
    cargoLock.lockFile = sources.cargo-equip.cargoLock."Cargo.lock".lockFile;
    nativeBuildInputs = [ pkg-config ];
    buildInputs = [ openssl ];
    doCheck = false;
  };

  online-judge-verify-helper = python3Packages.buildPythonApplication {
    inherit (sources.online-judge-verify-helper) pname version src;
    propagatedBuildInputs = with python3Packages; [
      colorlog
      pyyaml
      online-judge-tools
      setuptools
      toml
      importlab
    ];
    doCheck = false;
  };
}
