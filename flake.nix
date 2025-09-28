{
  description = "dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs?ref=nixos-24.11";

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    systems.url = "github:nix-systems/default";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    xremap = {
      url = "github:xremap/nix-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-apple-silicon = {
      url = "github:tpwrules/nixos-apple-silicon";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import inputs.systems;

      imports = [
        inputs.treefmt-nix.flakeModule
      ];

      flake = {
        nixosConfigurations = import ./systems/nixos { inherit inputs; };
        darwinConfigurations = {
          darwin = import ./systems/darwin { inherit inputs; };
          work = import ./systems/work { inherit inputs; };
        };
      };

      perSystem =
        { pkgs, system, ... }:
        {
          packages =
            let
              pkgs-stable = import inputs.nixpkgs-stable { inherit system; };
            in
            import ./pkgs { inherit pkgs pkgs-stable; };

          treefmt = {
            projectRootFile = "flake.nix";
            programs = {
              deno.enable = true;
              nixfmt.enable = true;
              taplo.enable = true;
              stylua.enable = true;
            };
          };
        };
    };
}
