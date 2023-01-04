local zsh_dir="$HOME/dotfiles/zsh"
source "$zsh_dir/common.zshrc"
case ${OSTYPE} in
    darwin*)
        source "$zsh_dir/mac.zshrc" ;;
    linux*)
        source "$zsh_dir/linux.zshrc" ;;
esac
