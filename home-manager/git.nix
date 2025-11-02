{
  userName ? "qitoy",
  userEmail ? "itmkan@icloud.com",
}:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = userName;
        email = userEmail;
      };
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
      user = {
        name = userName;
        email = userEmail;
      };
      ui = {
        pager = "less -FRX";
      };
    };
  };
}
