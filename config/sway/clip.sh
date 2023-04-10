> /tmp/sway_clip

wezterm start --class froat_nvim nvim /tmp/sway_clip || exit 1
wl-copy < /tmp/sway_clip
notify-send -t 1000 copied
