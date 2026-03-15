{
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  libffi,
  libtinfo,
  libxml2,
  git,
  openssl,
  pkgs-stable,
}:
rustPlatform.buildRustPackage rec {
  pname = "fixlang";
  version = "v1.1.0-alpha.12";
  src = fetchFromGitHub {
    owner = "tttmmmyyyy";
    repo = pname;
    tag = version;
    leaveDotGit = true;
    sha256 = "sha256-RjBMm3pOVo1KsLzCHpDJODdjvVCpIS9voH9a5FIyXd0=";
  };
  cargoHash = "sha256-qkNPGNjbgmhgUXN8Drr5o60Odw1xxIIIbY8z1afk1P8=";
  nativeBuildInputs = [
    git
    pkg-config
    pkgs-stable.llvmPackages_17.libllvm
  ];
  propagatedBuildInputs = [
    libffi
    libtinfo
    libxml2
  ];
  buildInputs = [ openssl ];
  doCheck = false;
}
