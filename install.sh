#!/usr/bin/env bash

# dotfiles
dotfiles=("vimrc" "vim" "latexmkrc" "zshrc" "zprofile")
for dotfile in "${dotfiles[@]}"; do
    ln -vnsf ~/dotfiles/.${dotfile} ~/.${dotfile}
done

# configs
ln -vnsf ~/dotfiles/wezterm ~/.config/wezterm
ln -vnsf ~/dotfiles/.vim ~/.config/nvim
