{ config, ... }:
{
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

  services.openssh.enable = true;
}
