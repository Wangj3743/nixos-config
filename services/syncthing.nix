
{ config, pkgs, ... }: {
  # CONFIG
  services.syncthing = {
    enable = true;
  }

  # USER PERMISSIONS
  users.users.syncthing.extraGroups = [ "srv" ];
}
