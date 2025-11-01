{
  inputs,
}:
let
  username = "qitoy";
  system = "aarch64-linux";
  pkgs = import inputs.nixpkgs { inherit system; };
  sources = pkgs.callPackage ../../_sources/generated.nix { };
  vivaldi-overlay = import ./vivaldi-overlay.nix;
in
inputs.nixpkgs.lib.nixosSystem {
  inherit system;
  modules = [
    {
      nixpkgs = {
        overlays = [ vivaldi-overlay ];
        config.allowUnfree = true;
      };
    }
    inputs.xremap.nixosModules.default
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
        useGlobalPkgs = true;
        users."${username}" = import ./home-manager.nix;
      };
    }
  ];
}
