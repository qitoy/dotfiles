{ inputs }:
let
  username = "qitoy";
  system = "aarch64-linux";
in
{
  nixos = inputs.nixpkgs.lib.nixosSystem {
    inherit system;
    modules = [
      ../../nixos
      ./hardware-configuration.nix
      inputs.agenix.nixosModules.default
      (inputs.nixos-apple-silicon + "/apple-silicon-support")
      inputs.home-manager.nixosModules.home-manager
      {
        environment.systemPackages = [ inputs.agenix.packages.${system}.default ];
        home-manager = {
          extraSpecialArgs = { inherit inputs; };
          users."${username}" = import ../../home-manager;
        };
      }
    ];
    specialArgs = {
      inherit inputs;
    };
  };
}
