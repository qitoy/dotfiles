{ pkgs, ... }: {

  home.packages = [ pkgs.font-awesome ];

  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      input = {
        kb_layout = "us,us";
        kb_variant = "dvp,";
        kb_model = "hhk";

        sensitivity = 0.7;

        touchpad = {
          natural_scroll = true;
          clickfinger_behavior = true;
          tap-to-click = false;
        };
      };

      monitor = "eDP-1,2560x1600@60,0x0,1.25";

      debug.disable_logs = false;

      "$mod" = "Super";
      "$terminal" = "footclient";

      workspace = [
        "special:term, on-created-empty:$terminal"
      ];

      windowrule = [
        "noblur, ^(footclient)$"
        "float, ^(sway_clip)$"
      ];

      bind = [
        "$mod, Return, exec, $terminal"
        "$mod Shift, Return, togglespecialworkspace, term"
        "$mod, c, exec, ${./clip.sh}"
        "$mod, d, exec, wofi --show drun --allow-images"

        "$mod, h, movefocus, l"
        "$mod, l, movefocus, r"
        "$mod, j, movefocus, d"
        "$mod, k, movefocus, u"
        "$mod Shift, h, movewindow, l"
        "$mod Shift, l, movewindow, r"
        "$mod Shift, j, movewindow, d"
        "$mod Shift, k, movewindow, u"

        "$mod Shift, q, killactive,"
        "$mod Shift, Space, togglefloating,"
        "$mod Shift, m, exec, hyprctl switchxkblayout xremap next"

        "$mod, F1, exec, brightnessctl set 5%-"
        "$mod, F2, exec, brightnessctl set 5%+"

        "$mod, F10, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        "$mod, F11, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        "$mod, F12, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
      ];

      exec-once = [
        "mako"
        "swayidle -w before-sleep 'swaylock -f'"
        "wl-paste --watch cliphist store"
      ];
    };
  };

  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
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
        modules-left = [ ];
        modules-center = [ ];
        modules-right = [ "network" "cpu" "memory" "temperature" "backlight" "pulseaudio" "battery" "clock" ];
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
