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

# secret token
source "$HOME/.secret"

zinit light zsh-users/zsh-autosuggestions
zinit light mollifier/anyframe

export PATH="$HOME/Library/Python/3.9/bin:$PATH"
export CPLUS_INCLUDE_PATH="$HOME/Library/include/:$HOME/AtCoder/C++/library/"

export HISTSIZE=10000
export SAVEHIST=10000

# set options
setopt interactive_comments
setopt magic_equal_subst
setopt correct

# use gh completion
gh completion -s zsh > /usr/local/share/zsh/site-functions/_gh

# autoload
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
autoload -Uz compinit && compinit -i

# set bindkey
bindkey -v
bindkey -M viins "^N" down-history
bindkey -M viins "^P" up-history
bindkey -M viins "^R" anyframe-widget-put-history
bindkey -M viins "^I" expand-or-complete-prefix

# alias
alias cdr="anyframe-widget-cdr"

export PATH="/opt/homebrew/opt/bc/bin:$PATH"
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env

export CLANGD_FLAGS="--header-insertion=never"

export SDKROOT="$(xcrun --sdk macosx --show-sdk-path)"

function powerline_precmd() {
    PS1="
$(powerline-shell --shell zsh $?)
$ "
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
