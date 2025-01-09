> /tmp/hypr_clip

ghostty --class=hypr.clip -e 'nvim /tmp/hypr_clip' || exit 1
head -c -1 /tmp/hypr_clip | wl-copy
notify-send -t 1000 copied
