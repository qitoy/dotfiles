# export
export CPLUS_INCLUDE_PATH="$HOME/Library/cpp-library"
export CLANGD_FLAGS="--header-insertion=never"
export EDITOR="vim"
export DENO_INSTALL="/home/qitoy/.deno"

# PATH
export PATH="$DENO_INSTALL/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export MOCWORD_DATA=$HOME/.mocword/mocword.sqlite

# secret token
source $HOME/.secret

### Added by Zinit's installer
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [[ ! -f ${ZINIT_HOME}/zinit.zsh ]]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

zinit light zsh-users/zsh-autosuggestions

# history
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
setopt hist_ignore_dups

# set options
setopt interactive_comments
setopt magic_equal_subst
# setopt correct

# autoload
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle 'chpwd:*' recent-dirs-max 5000

# set bindkey
bindkey -d
bindkey -e
bindkey "^U" backward-kill-line
bindkey "^I" expand-or-complete-prefix

autoload -U select-word-style
select-word-style bash

# powerline
. /usr/lib/python3.10/site-packages/powerline/bindings/zsh/powerline.zsh

# fzf
export FZF_DEFAULT_OPTS="--no-sort --cycle --multi --ansi"

function fzf-cdr() {
    local selected_dir=$(\cdr -l | awk '{print $2}' | fzf)
    selected_dir=${selected_dir/\~/$HOME}
    if [ -n "$selected_dir" ]; then
        cd "$selected_dir"
    fi
}
alias cdr="fzf-cdr"

function fzf-history() {
    local selected_command=$(history -n -r 1 | awk '!a[$0]++' | fzf --query "$LBUFFER")
    if [ -n "$selected_command" ]; then
        BUFFER=$selected_command
        CURSOR=$#BUFFER
    fi
}
zle -N fzf-history
bindkey "^R" fzf-history
