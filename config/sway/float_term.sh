#!/bin/bash -u

float_term=$(swaymsg -t get_tree | jq -c '.. | .floating_nodes? | arrays[] | select(.app_id=="float_term")')

if [ -z $float_term ]; then
  # wezterm --config initial_rows=55\
  #   --config initial_cols=200\
  #   start --class float_term
  footclient -W 200x55 -a float_term
else
  if [ "$(echo $float_term | jq .focused)" = 'true' ]; then
    swaymsg "move window to scratchpad"
  else
    swaymsg "[app_id=\"float_term\"] focus"
  fi
fi
