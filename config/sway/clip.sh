> /tmp/sway_clip

# wezterm start --class float_nvim nvim /tmp/sway_clip || exit 1
footclient -a float_nvim nvim /tmp/sway_clip || exit 1
head -c -1 /tmp/sway_clip | wl-copy
notify-send -t 1000 copied
