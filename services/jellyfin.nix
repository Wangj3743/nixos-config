{ config, pkgs, ... }: {
  # CONFIG
  services.jellyfin = {
    enable = true;
    openFirewall = false;
  };

  # USER PERMISSIONS
  users.users.jellyfin.extraGroups = [ "srv" ];
}
