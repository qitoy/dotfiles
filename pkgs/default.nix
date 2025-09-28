{ pkgs, pkgs-stable }:
{
  fixlang = pkgs.callPackage ./fixlang { inherit (pkgs-stable) llvmPackages_17 libtinfo; };
}
