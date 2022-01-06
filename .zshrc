export PS1="%~ $ "
export PATH="$HOME/Library/Python/3.9/bin:$PATH"
export CPLUS_INCLUDE_PATH="$HOME/Library/include/"
set -o vi

export PATH="/opt/homebrew/opt/bc/bin:$PATH"
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env

export CLANGD_FLAGS="--header-insertion=never"

export SDKROOT="$(xcrun --sdk macosx --show-sdk-path)"
