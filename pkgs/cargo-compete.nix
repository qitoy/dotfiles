{
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  openssl,
}:
rustPlatform.buildRustPackage rec {
  pname = "cargo-compete";
  version = "94b4d8ef500fc1fdb88ef26a3806102dca42fd1b";
  src = fetchFromGitHub {
    owner = "qitoy";
    repo = pname;
    rev = version;
    sha256 = "sha256-E40kzgpKwW6YezW2NIp/vNH4fEUx5P+XEqjIY5X3BC4=";
  };
  cargoHash = "sha256-8Hgo2wNnxjUJmwC1Ick8Nbv6IOUQLb5WuOvNWRm8APo=";
  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ openssl ];
  doCheck = false;
}

