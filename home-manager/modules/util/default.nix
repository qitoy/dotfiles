{
  lib,
  config,
  ...
}:
let
  inherit (lib) mkOption types;
in
{
  options.qitoy.util = {
    isWork = mkOption {
      type = types.bool;
      default = false;
    };
    user = {
      name = mkOption {
        type = types.str;
        default = config.home.username;
      };
      email = mkOption {
        type = types.str;
        default = "";
      };
    };
  };
}
