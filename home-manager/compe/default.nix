{
  pkgs,
  sources,
  inputs,
  ...
}:
let
  qitoypkgs = pkgs.callPackage ./packages.nix { inherit sources; };
  selfpkgs = inputs.self.packages.${pkgs.stdenv.hostPlatform.system};
in
{
  home.packages = [
    selfpkgs.cargo-compete
    qitoypkgs.cargo-equip
    pkgs.cargo-udeps
    qitoypkgs.pahcer
    qitoypkgs.online-judge-verify-helper
    pkgs.python3Packages.online-judge-tools
    pkgs.python3Packages.online-judge-api-client
  ];
}
