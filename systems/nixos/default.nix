{ inputs }:
let
  username = "qitoy";
  system = "aarch64-linux";
  pkgs = import inputs.nixpkgs { inherit system; };
  qitoypkgs = pkgs.callPackage ../../packages { };
in
{
  nixos = inputs.nixpkgs.lib.nixosSystem {
    inherit system;
    modules = [
      ../../nixos
      ./hardware-configuration.nix
      (inputs.nixos-apple-silicon + "/apple-silicon-support")
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
          extraSpecialArgs = { inputs = inputs // { inherit qitoypkgs; }; };
          users."${username}" = import ../../home-manager;
        };
      }
    ];
    specialArgs = {
      inputs = inputs // { inherit qitoypkgs; };
    };
  };
}
