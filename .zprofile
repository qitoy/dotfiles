eval "$(/opt/homebrew/bin/brew shellenv)"

# export
export CPLUS_INCLUDE_PATH="$HOME/Library/cpp-library"
export CLANGD_FLAGS="--header-insertion=never"
export SDKROOT="$(xcrun --sdk macosx --show-sdk-path)"

# secret token
source $HOME/.secret
