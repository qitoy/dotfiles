{
  inputs,
}:
let
  username = "qitoy";
  system = "x86_64-linux";
  pkgs = import inputs.nixpkgs { inherit system; };
  sources = pkgs.callPackage ../../_sources/generated.nix { };
in
inputs.nixpkgs.lib.nixosSystem {
  inherit system;
  specialArgs = { inherit username; };
  modules = [
    {
      nixpkgs = {
        config.allowUnfree = true;
      };
    }
    inputs.xremap.nixosModules.default
    ../../nixos
    ./hardware-configuration.nix
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t14-amd-gen5

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
