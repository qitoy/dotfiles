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

    nixos-apple-silicon.url = "github:tpwrules/nixos-apple-silicon";
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
