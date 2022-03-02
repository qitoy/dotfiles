export PS1="%~ $ "
export PATH="$HOME/Library/Python/3.9/bin:$PATH"
export CPLUS_INCLUDE_PATH="$HOME/Library/include/"
set -o vi

export PATH="/opt/homebrew/opt/bc/bin:$PATH"
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env

export CLANGD_FLAGS="--header-insertion=never"

export SDKROOT="$(xcrun --sdk macosx --show-sdk-path)"

function powerline_precmd() {
    PS1="$(powerline-shell --shell zsh $?)
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
