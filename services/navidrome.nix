{ config, pkgs, ... }: {
  # CONFIG
  services.navidrome = {
    enable = true;
    settings = {
      MusicFolder = "/srv/music";
    };
  };


  # DIRECTORIES
  systemd.tmpfiles.rules = [
    "d /srv/navidrome 2775 root srv -"
  ];
}
