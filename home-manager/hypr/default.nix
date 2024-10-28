{ pkgs, ... }: {

  home.packages = [ pkgs.font-awesome ];

  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      general = {
        gaps_in = 5;
        gaps_out = 10;
      };

      input = {
        kb_layout = "us,jp";
        kb_variant = "dvp,";
        kb_model = "hhk,applealu_jis";

        sensitivity = 0.7;

        touchpad = {
          natural_scroll = true;
          clickfinger_behavior = true;
          tap-to-click = false;
        };
      };

      gestures = {
        workspace_swipe = true;
      };

      monitor = "eDP-1,2560x1600@60,0x0,1.25";

      debug.disable_logs = false;

      "$mod" = "Super";
      "$terminal" = "alacritty";

      workspace = [
        "special:term, on-created-empty:$terminal"
      ];

      windowrule = [
        "noblur, ^(Alacritty)$"
        "float, ^(sway_clip)$"
      ];

      animation = [
        "specialWorkspace, 1, 4, default, slidefadevert -100%"
      ];

      bind = [
        "$mod, Return, exec, $terminal"
        "$mod Shift, Return, togglespecialworkspace, term"
        "$mod, c, exec, ${./clip.sh}"
        "$mod, d, exec, ${pkgs.wofi}/bin/wofi --show drun --allow-images"

        "$mod, h, movefocus, l"
        "$mod, l, movefocus, r"
        "$mod, j, movefocus, d"
        "$mod, k, movefocus, u"
        "$mod Shift, h, movewindow, l"
        "$mod Shift, l, movewindow, r"
        "$mod Shift, j, movewindow, d"
        "$mod Shift, k, movewindow, u"

        "$mod, left, workspace, -1"
        "$mod, right, workspace, +1"
        "$mod Shift, left, movetoworkspace, -1"
        "$mod Shift, right, movetoworkspace, +1"

        "$mod Shift, q, killactive,"
        "$mod Shift, Space, togglefloating,"
        "$mod Shift, m, exec, hyprctl switchxkblayout xremap next"
      ];

      binde = [
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
        ", XF86MonBrightnessUp, exec, brightnessctl set 5%+"

        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
      ];

      exec-once = [
        "${pkgs.mako}/bin/mako"
        "${pkgs.swayidle}/bin/swayidle -w before-sleep '${pkgs.swaylock-effects}/bin/swaylock -f'"
      ];
    };
  };

  programs.swaylock = {
    enable = true;
    settings = {
      screenshots = true;
      clock = true;
      ignore-empty-password = true;
      effect-pixelate = 16;
    };
  };

  services.mako = {
    enable = true;
  };

  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        spacing = 4;
        modules-left = [ "custom/powor" "hyprland/workspaces" ];
        modules-center = [ "hyprland/window" ];
        modules-right = [ "network" "cpu" "memory" "temperature" "backlight" "pulseaudio" "battery" "clock" ];
        "custom/powor" = {
          format = "";
          on-click = "${pkgs.sway}/bin/swaynag -t warning -m 'Power Menu Options' -b 'Shutdown' 'shutdown -h now' -b 'Restart' 'shutdown -r now' -b 'Logout' 'hyprctl dispatch exit'";
        };
        clock = {
          format = "{:%m-%d %H:%M}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };
        cpu = {
          format = "{usage}% ";
          tooltip = false;
        };
        memory = {
          format = "{}% ";
        };
        temperature = {
          critical-threshold = 80;
          format = "{temperatureC}°C {icon}";
          format-icons = [ "" "" "" ];
        };
        backlight = {
          format = "{percent}% {icon}";
          format-icons = [ "" "" "" "" "" "" "" "" "" ];
        };
        battery = {
          states = {
            good = 95;
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          format-charging = "{capacity}% ";
          format-plugged = "{capacity}% ";
          format-alt = "{time} {icon}";
          format-icons = [ "" "" "" "" "" ];
        };
        network = {
          format-wifi = "{essid} ({signalStrength}%) ";
          format-ethernet = "{ipaddr}/{cidr} ";
          tooltip-format = "{ifname} via {gwaddr} ";
          format-linked = "{ifname} (No IP) ";
          format-disconnected = "Disconnected ⚠";
          format-alt = "{ifname}: {ipaddr}/{cidr}";
        };
        pulseaudio = {
          format = "{volume}% {icon} {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [ "" "" "" ];
          };
        };
      };
    };
    style = builtins.readFile ./waybar.css;
  };
}
