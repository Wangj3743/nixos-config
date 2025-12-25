{ config, pkgs, ... }: {
  # CONFIG
  services.navidrome = {
    enable = true;
    dataDir = "/srv/navidrome";
    musicDirs = [
      "/srv/music/ongaku"
      "/srv/music/ongaku2"
    ];
    # user = "navidrome";
    port = 4533;
  };


  # DIRECTORIES
  systemd.tmpfiles.rules = [
    "d /srv/navidrome 2775 root srv -"
  ];
}
