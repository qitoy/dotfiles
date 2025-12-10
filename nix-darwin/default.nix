{ pkgs, ... }:
{
  nix = {
    optimise.automatic = true;
    settings = {
      experimental-features = "nix-command flakes";
      max-jobs = 8;
    };
  };

  system = {
    defaults = {
      NSGlobalDomain = {
        AppleShowAllExtensions = true;
        "com.apple.trackpad.scaling" = 3.0;
      };
      controlcenter = {
        BatteryShowPercentage = true;
        Bluetooth = true;
        Sound = true;
      };
      dock = {
        autohide = true;
      };
      finder = {
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
      };
    };
    stateVersion = 6;
  };

  environment.systemPackages = [
    pkgs.nh
  ];

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
    };
    casks = [
      "karabiner-elements"
      "microsoft-teams"
      "programmer-dvorak"
      "raycast"
    ];
  };
}
