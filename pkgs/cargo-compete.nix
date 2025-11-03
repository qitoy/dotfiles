{
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  openssl,
}:
rustPlatform.buildRustPackage rec {
  pname = "cargo-compete";
  version = "f11c742e64ed6d9d69700295aa3e28161226e357";
  src = fetchFromGitHub {
    owner = "qitoy";
    repo = pname;
    rev = version;
    sha256 = "sha256-csty4cQMEfQ/KiRLMEWpL9CJ/h7/KGT2KmnGXKfGVBo=";
  };
  cargoHash = "sha256-Vryho8VgKLhk8GENI3jKgdXCjpzGNE5fCkFQRxSkwKc=";
  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ openssl ];
  doCheck = false;
}
