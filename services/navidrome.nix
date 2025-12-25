{ config, pkgs, ... }: {
  # CONFIG
  services.navidrome = {
    enable = true;
    settings = {
      MusicFolder = "/srv/media/music";
    };
  };


  # DIRECTORIES
  systemd.tmpfiles.rules = [
    "d /srv/media/music 2775 root srv -"
  ];
}
