{
  inputs,
}:
let
  username = "qitoy";
  system = "aarch64-darwin";
  pkgs = import inputs.nixpkgs { inherit system; };
  sources = pkgs.callPackage ../../_sources/generated.nix { };
in
{
  darwin = inputs.nix-darwin.lib.darwinSystem {
    inherit system;
    modules = [
      ../../nix-darwin
      inputs.home-manager.darwinModules.home-manager
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
  };
}
