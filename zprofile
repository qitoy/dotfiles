local zsh_dir="$HOME/dotfiles/zsh"
source "$zsh_dir/common.zprofile"
case ${OSTYPE} in
    darwin*)
        source "$zsh_dir/mac.zprofile" ;;
    linux*)
        source "$zsh_dir/linux.zprofile" ;;
esac
