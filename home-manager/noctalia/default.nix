{
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia-shell = {
    enable = pkgs.stdenv.hostPlatform.isLinux;
    settings = {
      bar = {
        position = "top";
        widgets = {
          left = [
            { id = "Launcher"; }
            { id = "SystemMonitor"; }
            { id = "ActiveWindow"; }
          ];
          center = [ { id = "Workspace"; } ];
          right = [
            { id = "NotificationHistory"; }
            { id = "Battery"; }
            { id = "Volume"; }
            { id = "Brightness"; }
            {
              id = "Clock";
              formatHorizontal = "yyyy-MM-dd HH:mm:ss";
            }
            { id = "ControlCenter"; }
          ];
        };
      };
    };
  };
}
