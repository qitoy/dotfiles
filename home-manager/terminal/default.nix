{ pkgs, ... }:
{
  programs.ghostty = {
    enable = true;
    package = if pkgs.stdenv.hostPlatform.isLinux then pkgs.ghostty else pkgs.ghostty-bin;
    clearDefaultKeybinds = true;
    settings = {
      font-size = 12;
      font-family = "Moralerspace Neon";
      font-feature = [
        "-calt"
        "-liga"
        "-dlig"
      ];

      theme = "Starlight";
      background-opacity = 0.85;

      window-decoration = true;

      mouse-hide-while-typing = true;

      keybind = [
        "ctrl+shift+c=copy_to_clipboard"
        "ctrl+shift+v=paste_from_clipboard"
        "ctrl+shift+t=new_tab"
        "ctrl+shift+n=new_window"
        "ctrl+tab=next_tab"
        "ctrl+shift+tab=previous_tab"

        "global:super+shift+enter=toggle_quick_terminal"
      ];

      macos-option-as-alt = true;
      macos-non-native-fullscreen = true;
      quick-terminal-position = "top";
      quick-terminal-screen = "main";
    };
  };
}
