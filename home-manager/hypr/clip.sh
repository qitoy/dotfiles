> /tmp/sway_clip

alacritty --class sway_clip --command nvim /tmp/sway_clip || exit 1
head -c -1 /tmp/sway_clip | wl-copy
notify-send -t 1000 copied
