{ config, pkgs, ... }: {
  # CONFIG
  services.navidrome = {
    enable = true;
    settings = {
      MusicFolder = "/srv/media/music";
    };
  };
}
