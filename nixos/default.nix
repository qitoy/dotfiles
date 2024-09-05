{ config, pkgs, inputs, ... }: {
  imports = [
    inputs.xremap.nixosModules.default
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = false;

  hardware.asahi = {
    enable = true;
    setupAsahiSound = true;
    withRust = true;
    useExperimentalGPUDriver = true;
    experimentalGPUInstallMode = "replace";
  };

  powerManagement.enable = true;
  services.tlp.enable = true;

  xdg.mime = {
    enable = true;
    defaultApplications = {
      "text/html" = "vivaldi-stable.desktop";
      "x-scheme-handler/http" = "vivaldi-stable.desktop";
      "x-scheme-handler/https" = "vivaldi-stable.desktop";
      "x-scheme-handler/about" = "vivaldi-stable.desktop";
      "x-scheme-handler/unknown" = "vivaldi-stable.desktop";
    };
  };

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  nixpkgs.config.allowUnfree = true;

  # networking.hostName = "nixos"; # Define your hostname.
  networking = {
    wireless.iwd = {
      enable = true;
      settings.General.EnableNetworkConfiguration = true;
    };
    firewall = {
      enable = true;
      trustedInterfaces = [ "tailscale0" ];
      allowedUDPPorts = [ config.services.tailscale.port ];
    };
  };

  services.tailscale = {
    enable = true;
    openFirewall = true;
  };

  time.timeZone = "Asia/Tokyo";
  i18n.defaultLocale = "ja_JP.UTF-8";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  services.blueman.enable = true;

  swapDevices = [{
    device = "/var/swapfile";
    size = 8 * 1024;
  }];

  users.users.qitoy = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
    gcc
    firefox
    (vivaldi.override {
      proprietaryCodecs = true;
      vivaldi-ffmpeg-codecs = inputs.qitoy.packages.aarch64-linux.vivaldi-ffmpeg-codecs;
    })
    wl-clipboard
    xdg-utils

    # for hyprland
    libnotify
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  programs.nh = {
    enable = true;
    flake = "/home/qitoy/dotfiles";
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  security.pam.services.swaylock = { }; # for swaylock

  programs.zsh.enable = true;

  services.openssh.enable = true;

  services.xremap = {
    withWlroots = true;
    watch = true;
    config = {
      modmap = [
        {
          remap.Space = {
            held = "Shift_L";
            alone = "Space";
          };
        }
      ];
      keymap = [
        {
          remap = {
            Yen = "Dollar";
            Shift-Yen = "Shift-Grave";
          };
        }
      ];
    };
  };

  # agenix secrets
  age.secrets.wifi.file = ./secrets/wifi.age;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.05"; # Did you read the comment?

}
