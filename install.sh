#!/usr/bin/env bash

# install homebrew
which brew > /dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# clone dotfiles
dotfiles_dir="$HOME/dotfiles"
if [ ! -d $dotfiles_dir ]; then
    git clone https://github.com/qitoy/dotfiles.git $dotfiles_dir
fi

touch $HOME/.secret

# vim undodir
mkdir -p $dotfiles_dir/.vim/undo $dotfiles_dir/.vim/nundo

# dotfiles
dotfiles=("vimrc" "vim" "latexmkrc" "zshrc" "zprofile" "w3m")
case ${OSTYPE} in
    darwin*)
        dotfiles+=("hammerspoon") ;;
    linux*)
        dotfiles+=("xprofile") ;;
esac
for dotfile in "${dotfiles[@]}"; do
    ln -vnsf "$dotfiles_dir/.${dotfile}" "$HOME/.${dotfile}"
done

# configs
mkdir -p $HOME/.config
for dir in $(ls $dotfiles_dir/.config); do
    ln -vnsf "$dotfiles_dir/.config/${dir}" "$HOME/.config/${dir}"
done
ln -vnsf "$dotfiles_dir/.vim" "$HOME/.config/nvim"

# cpp-library
if [ ! -d $HOME/Library/cpp-library ]; then
        git clone https://github.com/qitoy/cpp-library.git $HOME/Library/cpp-library
fi
