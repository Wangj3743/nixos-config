{ config, pkgs, ... }: {
  # CONFIG
  services.immich = {
    enable = true;
    host = "0.0.0.0";
    port = 2283;
    mediaLocation = "/srv/immich";
  };

  # FIREWALL
  networking.firewall.interfaces.tailscale0.allowedTCPPorts = [ 2283 ];

  # USER PERMISSIONS
  users.users.immich.extraGroups = [ "srv" ];
}
