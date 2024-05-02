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
  };

  outputs = inputs: {
    apps.aarch64-linux.default =
    let pkgs = inputs.nixpkgs.legacyPackages.aarch64-linux;
    in inputs.flake-utils.lib.mkApp { drv = pkgs.writeShellScriptBin "switch.sh" ''
    home-manager switch --flake .#linux --impure
    ./mklink.sh
    ''; };

    homeConfigurations = {
      linux = inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = import inputs.nixpkgs {
          system = "aarch64-linux";
        };
        extraSpecialArgs = {
          inherit inputs;
        };
        modules = [
          ./home.nix
        ];
      };
    };
  };
}
