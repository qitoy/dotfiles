{
  config,
  ...
}:
let
  inherit (config.qitoy.util) user;
in
{
  programs.git = {
    enable = true;
    settings = {
      inherit user;
      aliases = {
        browse = "!deno run --allow-net --allow-run --allow-read --allow-env jsr:@lambdalisue/git-browse/cli";
      };
    };
    ignores = [
      "*.DS_Store"
      "*.swp"
      "*.netrwhist"
      "*.out"
      "*.gch"
      "*.satysfi-aux"
      ".jj"
      "result"
      "result-*"
      ".direnv"
    ];
  };

  programs.gh = {
    enable = true;
    settings = {
      git_protocol = "ssh";
    };
  };

  programs.jujutsu = {
    enable = true;
    settings = {
      inherit user;
      ui = {
        pager = "less -FRX --tabs 4";
      };
    };
  };
}
