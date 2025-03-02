{ pkgs, ... }:
{
  programs.ghostty = {
    enable = true;
    # ghostty is temporary broken in macos
    package = if pkgs.stdenv.isLinux then pkgs.ghostty else null;
    clearDefaultKeybinds = true;
    settings = {
      font-family = "MoralerspaceNeonNF";
      font-style = "Regular";
      font-size = 12.5;
      font-feature = [
        "-calt"
        "-liga"
        "-dlig"
      ];

      theme = "starlight";
      background-opacity = 0.85;

      window-decoration = false;

      mouse-hide-while-typing = true;

      keybind = [
        "ctrl+shift+c=copy_to_clipboard"
        "ctrl+shift+v=paste_from_clipboard"

        "global:super+shift+enter=toggle_quick_terminal"
      ];

      macos-non-native-fullscreen = true;
      quick-terminal-position = "top";
      quick-terminal-screen = "main";
    };
  };
}
