{
  inputs,
}:
let
  inherit (inputs) nixpkgs home-manager nixos-apple-silicon;
  username = "qitoy";
  system = "aarch64-linux";
  vivaldi-overlay = import ./vivaldi-overlay.nix;
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
          extraSpecialArgs = {
            inherit (inputs) neovim-nightly-overlay;
            overlays = [ vivaldi-overlay ];
          };
          useUserPackages = true;
          users."${username}" = import ../../home-manager;
        };
      }
    ];
    specialArgs = { inherit (inputs) xremap; };
  };
}
