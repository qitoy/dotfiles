{ source, lib, rustPlatform }: rustPlatform.buildRustPackage {
  inherit (source) pname version src;

  cargoLock.lockFile = source.cargoLock."Cargo.lock".lockFile;

  doCheck = false;

  passthru = { runnable = true; };

  meta = with lib; {
    description = "A Cargo subcommand for creating standalone source files with base64-encoded payload.";
    homepage = "https://github.com/qryxip/cargo-executable-payload";
    license = with licenses; [ mit asl20 ];
    platforms = platforms.all;
  };
}
