#!/usr/bin/env bash

# install homebrew
which brew || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# clone dotfiles
if [ ! -d $HOME/dotfiles ]; then
    git clone https://github.com/qitoy/dotfiles.git $HOME/dotfiles
fi

# vim undodir
mkdir -p $HOME/dotfiles/.vim/undo

# dotfiles
dotfiles=("vimrc" "vim" "latexmkrc" "zshrc" "zprofile")
for dotfile in "${dotfiles[@]}"; do
    ln -vnsf $HOME/dotfiles/.${dotfile} $HOME/.${dotfile}
done

# configs
ln -vnsf $HOME/dotfiles/.config $HOME/.config

# cpp-library
if [ ! -d $HOME/Library/cpp-library/ ]; then
        git clone https://github.com/qitoy/cpp-library.git $HOME/Library/cpp-library
fi
