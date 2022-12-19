zshrc_dir="$HOME/dotfiles/zshrc"
source "$zshrc_dir/common.zsh"
case ${OSTYPE} in
    darwin*)
        source "$zshrc_dir/mac.zsh" ;;
    linux*)
        source "$zshrc_dir/linux.zsh" ;;
esac
