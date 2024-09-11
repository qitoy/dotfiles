{ callPackage, lib }:
let
  names = lib.subtractLists [ "default.nix" ] (builtins.attrNames (builtins.readDir ./.));
  sources = callPackage ../_sources/generated.nix { };
in
builtins.listToAttrs (builtins.map
  (name: {
    inherit name;
    value = callPackage ./${name} {
      source = sources.${name};
    };
  })
  names)
