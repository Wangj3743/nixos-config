{ config, pkgs, ... }: {
  # CONFIG
  services.jellyfin = {
    enable = true;
    openFirewall = false;
  };

  # USER PERMISSIONS
  users.users.jellyfin.extragroups = [ "srv" ];

  # DIRECTORIES
  systemd.tmpfiles.rules = [
    "d /srv/media 2775 root srv -"
    "d /srv/media/music 2775 root srv -"
    "d /srv/media/movies 2775 root srv -"
    "d /srv/media/tv 2775 root srv -"
  ];
}
