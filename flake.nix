{
  description = "dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
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
      # url = "github:tpwrules/nixos-apple-silicon";
      url = "github:oliverbestmann/nixos-apple-silicon";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs
    , home-manager
    , neovim-nightly-overlay
    , xremap
    , nixos-apple-silicon
    , ...
    }: {
      nixosConfigurations = import ./systems/nixos {
        inherit nixpkgs home-manager neovim-nightly-overlay xremap nixos-apple-silicon;
      };
    };
}
