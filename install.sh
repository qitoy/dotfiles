#!/usr/bin/env bash

# install homebrew
which brew || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# clone dotfiles
if [ ! -d $HOME/dotfiles ]; then
    git clone https://github.com/qitoy/dotfiles $HOME/dotfiles
fi

# dotfiles
dotfiles=("vimrc" "vim" "latexmkrc" "zshrc" "zprofile")
for dotfile in "${dotfiles[@]}"; do
    ln -vnsf ~/dotfiles/.${dotfile} ~/.${dotfile}
done

# configs
ln -vnsf ~/dotfiles/wezterm ~/.config/wezterm
ln -vnsf ~/dotfiles/.vim ~/.config/nvim
