eval "$(/opt/homebrew/bin/brew shellenv)"

# export
export CPLUS_INCLUDE_PATH="$HOME/Library/cpp-library"
export CLANGD_FLAGS="--header-insertion=never"
export SDKROOT="$(xcrun --sdk macosx --show-sdk-path)"

# PATH
export PATH="/opt/homebrew/Cellar/icu4c/70.1/bin:$PATH"
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/Cellar/coreutils/9.1/bin:$PATH"

# secret token
source $HOME/.secret
