{ pkgs, sources, ... }:
let
  qitoypkgs = pkgs.callPackage ./packages.nix { inherit sources; };
in
{
  home.packages = [
    qitoypkgs.cargo-compete
    qitoypkgs.cargo-equip
    pkgs.cargo-udeps
    qitoypkgs.pahcer
    qitoypkgs.online-judge-verify-helper
    pkgs.python3Packages.online-judge-tools
    pkgs.python3Packages.online-judge-api-client
  ];
}
