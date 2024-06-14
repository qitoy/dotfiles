{ ... }: {
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
      "$WOBSOCK" = "$XDG_RUNTIME_DIR/wob.sock";

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
        "$mod, c, exec, ${./hypr/clip.sh}"
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

        "$mod, F1, exec, brightnessctl set 5%- | grep Current | sed 's/.*(\(.*\)%).*/\1/' > $WOBSOCK"
        "$mod, F2, exec, brightnessctl set 5%+ | grep Current | sed 's/.*(\(.*\)%).*/\1/' > $WOBSOCK"

        "$mod, F10, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle && wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2*100*($3==\"\")}' > $WOBSOCK"
        "$mod, F11, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- && wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2*100*($3==\"\")}' > $WOBSOCK"
        "$mod, F12, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ && wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2*100*($3==\"\")}' > $WOBSOCK"
      ];

      exec-once = [
        "foot --server"
        "waybar"
        "mako"
        "hypridle"
        "rm -f $WOBSOCK && mkfifo $WOBSOCK && tail -f $WOBSOCK | wob"
        "wl-paste --watch cliphist store"
      ];
    };
  };

  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };
    };
  };

  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        ignore_empty_input = true;
      };
    };
  };
}
