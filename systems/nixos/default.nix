{ nixpkgs
, home-manager
, neovim-nightly-overlay
, xremap
, nixos-apple-silicon
}:
let
  username = "qitoy";
  system = "aarch64-linux";
  pkgs = import nixpkgs { inherit system; };
  qitoypkgs = pkgs.callPackage ../../packages { };
in
{
  nixos = nixpkgs.lib.nixosSystem {
    inherit system;
    modules = [
      ../../nixos
      ./hardware-configuration.nix
      nixos-apple-silicon.nixosModules.default
      {
        hardware.asahi = {
          enable = true;
          setupAsahiSound = true;
          withRust = true;
          useExperimentalGPUDriver = true;
          experimentalGPUInstallMode = "replace";
        };
      }
      home-manager.nixosModules.home-manager
      {
        home-manager = {
          extraSpecialArgs = { inherit neovim-nightly-overlay qitoypkgs; };
          users."${username}" = import ../../home-manager;
        };
      }
    ];
    specialArgs = { inherit xremap qitoypkgs; };
  };
}
