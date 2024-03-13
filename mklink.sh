#!/usr/bin/env zsh

set -ueC

local -a dots
local -a configs
local -a symlinks

dot_path=$(cd $(dirname $0) && pwd)

dots+=("latexmkrc" "w3m" "vim" "gitmessage")
configs+=("git" "efm-langserver" "home-manager")
symlinks+=("$dot_path/vim $HOME/.config/nvim")

case $OSTYPE in
    darwin*)
        dots+=("hammerspoon")
        configs+=("karabiner");;
    linux*)
        configs+=("systemd" "i3" "sway" "swaylock" "waybar");;
esac

for conf in $configs; do dots+=("config/$conf"); done
for dot in $dots; do symlinks+=("$dot_path/$dot $HOME/.$dot"); done

for sym in $symlinks; do eval "ln -nsfv $sym"; done
