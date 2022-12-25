# use gh completion
gh completion -s zsh > /usr/local/share/zsh/site-functions/_gh

[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env

# vim:ft=zsh
