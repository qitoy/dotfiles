{ ... }:
{
  nix = {
    optimise.automatic = true;
    settings = {
      experimental-features = "nix-command flakes";
      max-jobs = 8;
    };
  };

  system = {
    defaults = { };
    stateVersion = 6;
  };

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
    };
    casks = [
      "ghostty"
      "karabiner-elements"
      "programmer-dvorak"
      "vivaldi"
      "steam"
      "discord"
      "slack"
    ];
  };
}
