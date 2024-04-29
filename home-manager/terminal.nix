{ ... }: {
  programs.foot = {
    enable = true;
    # server.enable = true;
    settings = {
      main = {
        font = "UDEV Gothic 35LG:size=12.5";
      };
      colors.alpha = 0.85;
    };
  };

  programs.wezterm = {
    # enable = true;
    extraConfig = ''
      local wezterm = require "wezterm"
      local act = wezterm.action

      -- wezterm.on("gui-startup", function()
      --     local tab, pane, window = wezterm.mux.spawn_window{}
      --     window:gui_window():toggle_fullscreen()
      -- end)

      return {
          -- font = wezterm.font("UDEV Gothic 35LG"),
          initial_cols = 100,
          initial_rows = 48,
          use_ime = false,
          font_size = 12.5,
          color_scheme = "carbonfox",
          window_background_opacity = 0.85,
          hide_tab_bar_if_only_one_tab = true,
          window_decorations = "NONE",
          window_padding = {
              left = 0,
              right = 0,
              top = 0,
              bottom = 0,
          },
          default_cursor_style = 'BlinkingBlock',
          keys = {
              { key = '+', mods = 'SUPER', action = act.DisableDefaultAssignment, },
              { key = '+', mods = 'CTRL' , action = act.DisableDefaultAssignment, },
              { key = '-', mods = 'SUPER', action = act.DisableDefaultAssignment, },
              { key = '-', mods = 'CTRL' , action = act.DisableDefaultAssignment, },
              { key = '=', mods = 'SUPER', action = act.DisableDefaultAssignment, },
              { key = '=', mods = 'CTRL' , action = act.DisableDefaultAssignment, },
              { key = '0', mods = 'SUPER', action = act.DisableDefaultAssignment, },
              { key = '0', mods = 'CTRL' , action = act.DisableDefaultAssignment, },
          }
      }
    '';
  };
}
