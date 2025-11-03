{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib) mkIf mkOption types;
  cfg = config.programs.niri;
in
{
  options.programs.niri = {
    enable = lib.mkEnableOption "niri";
    package = lib.mkPackageOption pkgs "niri" { };
    xwayland = mkOption {
      type = types.bool;
      default = true;
    };
    settings = mkOption {
      type = (pkgs.formats.json { }).type;
      default = { };
    };
    spawn-at-startup = mkOption {
      type = types.listOf (
        types.oneOf [
          types.str
          (types.listOf types.str)
        ]
      );
      default = [ ];
    };
  };

  config = mkIf cfg.enable {
    home.packages = [ cfg.package ] ++ lib.optional cfg.xwayland pkgs.xwayland-satellite;
    xdg.configFile."niri/config.kdl".text =
      (lib.hm.generators.toKDL { } cfg.settings)
      + (lib.concatStringsSep "\n" (
        map (
          item:
          if builtins.isString item then
            "spawn-at-startup \"${item}\""
          else
            "spawn-at-startup " + lib.concatStringsSep " " (map (x: "\"${x}\"") item)
        ) cfg.spawn-at-startup
      ));
  };
}
