#!/usr/bin/env bash

# install homebrew
which brew || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# clone dotfiles
if [ ! -d $HOME/dotfiles ]; then
    git clone https://github.com/qitoy/dotfiles $HOME/dotfiles
fi

# vim undodir
mkdir -p $HOME/dotfiles/.vim/undo

# dotfiles
dotfiles=("vimrc" "vim" "latexmkrc" "zshrc" "zprofile")
for dotfile in "${dotfiles[@]}"; do
    ln -vnsf $HOME/dotfiles/.${dotfile} $HOME/.${dotfile}
done

# configs
if [ ! -d $HOME/.config ]; then
    mkdir $HOME/.config
fi
ln -vnsf $HOME/dotfiles/wezterm $HOME/.config/wezterm
ln -vnsf $HOME/dotfiles/.vim $HOME/.config/nvim
