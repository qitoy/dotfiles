### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

zinit light zsh-users/zsh-autosuggestions
zinit light mollifier/anyframe

# history
export HISTSIZE=10000
export SAVEHIST=10000

# set options
setopt interactive_comments
setopt magic_equal_subst
# setopt correct

# use gh completion
gh completion -s zsh > /usr/local/share/zsh/site-functions/_gh

# autoload
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
fi
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle 'chpwd:*' recent-dirs-max 5000

# set bindkey
bindkey -d
bindkey -e
bindkey "^R" anyframe-widget-put-history
bindkey "^U" backward-kill-line
bindkey "^I" expand-or-complete-prefix

autoload -U select-word-style
select-word-style bash

# alias
alias cdr="anyframe-widget-cdr"
alias kuin="kuin -s /opt/homebrew/opt/kuin/sys/"

[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env

function powerline_precmd() {
    PS1=$(echo -e "\n$(powerline-shell --shell zsh $?)\n$ ")
}

function install_powerline_precmd() {
    for s in "${precmd_functions[@]}"; do
        if [ "$s" = "powerline_precmd" ]; then
            return
        fi
    done
    precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
