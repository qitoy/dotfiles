{
  description = "dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

    xremap.url = "github:xremap/nix-flake";

    flake-utils.url = "github:numtide/flake-utils";

    qitoy = {
      url = "github:qitoy/flakes";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };

    nixos-apple-silicon.url = "github:tpwrules/nixos-apple-silicon";

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs: {
    nixosConfigurations = {
      qitoy = inputs.nixpkgs.lib.nixosSystem rec {
        system = "aarch64-linux";
        modules = [
          ./configuration.nix
          inputs.agenix.nixosModules.default
          {
            environment.systemPackages = [ inputs.agenix.packages.${system}.default ];
          }
        ];
        specialArgs = {
          inherit inputs;
        };
      };
    };

    homeConfigurations = {
      linux =
        let system = "aarch64-linux";
        in inputs.home-manager.lib.homeManagerConfiguration {
          pkgs = import inputs.nixpkgs {
            inherit system;
          };
          extraSpecialArgs = {
            inherit inputs;
            inherit system;
          };
          modules = [
            ./home.nix
          ];
        };
    };
  };
}
