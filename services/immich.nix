{ config, pkgs, ... }: {
  # CONFIG
  services.immich = {
    enable = true;
    openFirewall = false
  };

  # DIRECTORIES
  systemd.tmpfiles.rules = [
    "d /srv/photos 2775 root srv -"
  ];
}
