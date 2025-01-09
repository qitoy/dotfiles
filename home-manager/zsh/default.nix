{ ... }:
{
  programs.powerline-go = {
    enable = true;
    newline = true;
  };

  programs.zsh = {
    defaultKeymap = "emacs";
    dotDir = ".config/zsh";
    enable = true;
    envExtra = ''
      if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then
        . ~/.nix-profile/etc/profile.d/nix.sh
      fi
    '';
    initExtra = ''
      zmodload zsh/zpty

      autoload -U select-word-style
      select-word-style bash

      autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
      add-zsh-hook chpwd chpwd_recent_dirs
      zstyle ':chpwd:*' recent-dirs-max 10000

      bindkey "^U" backward-kill-line

      . ${./.}/fzf.zsh
    '';
    shellAliases = {
      cdr = "fzf-cdr";
      cg = "fzf-ghq";
    };
    profileExtra = ''
      export PATH="$HOME/.cargo/bin:$PATH"
      export PATH="$HOME/go/bin:$PATH"
    '';
  };

  programs.fzf = {
    enable = true;
    defaultOptions = [
      "--no-sort"
      "--cycle"
      "--multi"
      "--ansi"
    ];
  };

}
