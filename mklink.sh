#!/usr/bin/env zsh

set -ueC

local -a dots
local -a configs
local -a symlinks

dot_path=$(cd $(dirname $0) && pwd)

dots+=("latexmkrc")
configs+=("efm-langserver")
symlinks+=("$dot_path/vim $HOME/.config/nvim")

case $OSTYPE in
    darwin*)
        dots+=("hammerspoon")
        configs+=("karabiner");;
    linux*)
        configs+=("i3" "sway");;
esac

for conf in $configs; do dots+=("config/$conf"); done
for dot in $dots; do symlinks+=("$dot_path/$dot $HOME/.$dot"); done

for sym in $symlinks; do eval "ln -nsfv $sym"; done
