{ source, lib, rustPlatform, pkg-config, openssl }: rustPlatform.buildRustPackage {
  inherit (source) pname version src;

  cargoLock.lockFile = source.cargoLock."Cargo.lock".lockFile;

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  doCheck = false;

  passthru = { runnable = true; };

  meta = with lib; {
    description = "A Cargo subcommand for competitive programming.";
    homepage = "https://github.com/qryxip/cargo-compete";
    license = with licenses; [ mit asl20 ];
    platforms = platforms.all;
  };
}
