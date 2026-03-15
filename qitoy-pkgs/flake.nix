{
  description = "qitoy-pkgs";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs?ref=nixos-24.11";

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    systems.url = "github:nix-systems/default";
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import inputs.systems;

      perSystem =
        { pkgs, system, ... }:
        {
          packages =
            let
              pkgs-stable = import inputs.nixpkgs-stable { inherit system; };
            in
            pkgs.lib.filesystem.packagesFromDirectoryRecursive {
              callPackage = pkgs.lib.callPackageWith (pkgs // { inherit pkgs-stable; });
              directory = ./pkgs;
            };
        };
    };
}
