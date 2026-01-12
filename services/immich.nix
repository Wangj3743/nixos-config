{ config, pkgs, ... }: {
  # CONFIG
  services.immich = {
    enable = true;
    host = "0.0.0.0";
    port = 2283;
    mediaLocation = "/srv/images/immich"
  };

  # USER PERMISSIONS
  users.users.immich.extraGroups = [ "srv" ];
}
