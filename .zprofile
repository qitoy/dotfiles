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
