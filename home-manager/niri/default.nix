{
  pkgs, ...
}: {
  home.packages = with pkgs; [ niri xwayland-satellite wofi ];
  xdg.configFile = {
    # "niri/config.kdl".text =
    #   lib.hm.generators.toKDL {} {
    #     input = {
    #       keyboard = {
    #         xkb = {
    #           layout = "us,jp";
    #           options = "ctrl:nocaps";
    #           variant = "dvp,";
    #         };
    #
    #       };
    #     };
    #   };
  };
}
