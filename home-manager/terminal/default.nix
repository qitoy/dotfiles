{ ... }:
{
  programs.ghostty = {
    enable = true;
    clearDefaultKeybinds = true;
    settings = {
      font-family = "MoralerspaceNeonNF";
      font-style = "Regular";
      font-size = 12.5;
      font-feature = [ "-calt" "-liga" "-dlig" ];

      theme = "starlight";
      background-opacity = 0.85;

      window-decoration = false;

      mouse-hide-while-typing = true;

      keybind = [
        "ctrl+shift+c=copy_to_clipboard"
        "ctrl+shift+v=paste_from_clipboard"
      ];
    };
  };
}
