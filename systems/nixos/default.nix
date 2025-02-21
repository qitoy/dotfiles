{
  inputs,
}:
let
  username = "qitoy";
  system = "aarch64-linux";
  pkgs = import inputs.nixpkgs { inherit system; };
  sources = pkgs.callPackage ../../_sources/generated.nix { };
in
{
  nixos = inputs.nixpkgs.lib.nixosSystem {
    inherit system;
    modules = [
      ../../nixos
      ./hardware-configuration.nix
      inputs.nixos-apple-silicon.nixosModules.default
      {
        hardware.asahi = {
          enable = true;
          setupAsahiSound = true;
          withRust = true;
          useExperimentalGPUDriver = true;
          experimentalGPUInstallMode = "replace";
        };
      }
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          extraSpecialArgs = {
            inherit inputs sources username;
          };
          useUserPackages = true;
          users."${username}" = import ./home-manager.nix;
        };
      }
    ];
    specialArgs = { inherit (inputs) xremap; };
  };
}
