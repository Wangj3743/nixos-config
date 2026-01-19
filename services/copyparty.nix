{ config, pkgs, ... }: {
  # PKG
  environment.systemPackages = with pkgs; [
    copyparty
    cloudflared
  ];
  
  # SYSTEMD SERVICE
  systemd.services.copyparty = {
    description = "Copyparty File Server";
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ];

    serviceConfig = {
      Type = "simple";
      User = "yuni";
      Group = "srv";

      WorkingDirectory = "/srv";
      ExecStart = "${pkgs.copyparty}/bin/copyparty -c ~/.config/copyparty/copyparty.conf";
      Restart = "on-failure";
    };
  };

  # DIRECTORIES
  systemd.tmpfiles.rules = [
    "d /srv 2775 root srv -"
    "d /srv/docs 2775 root srv -"
    "d /srv/videos 2775 root srv -"
    "d /srv/projects 2775 root srv -"
    "d /srv/games 2775 root srv -"
    "d /srv/dumps 2775 root srv -"
    "d /srv/archives 2775 root srv -"

    "d /srv/media 2770 root srv -"
    "d /srv/media/music 2770 root srv -"
    "d /srv/media/movies 2770 root srv -"
    "d /srv/media/tv 2770 root srv -"
    "d /srv/media/books 2770 root srv -"

    "d /srv/immich 2775 root srv -"
    "d /srv/immich/upload/ 2775 root srv -"
    "d /srv/immich/library/ 2775 root srv -"
    "d /srv/immich/thumbs/ 2775 root srv -"
    "d /srv/immich/encoded-video/ 2775 root srv -"
    "d /srv/immich/profile/ 2775 root srv -"
    "d /srv/immich/backups/ 2775 root srv -"
    "f /srv/immich/.immich 0664 root srv - -"
    "f /srv/immich/upload/.immich 0664 root srv - -"
    "f /srv/immich/library/.immich 0664 root srv - -"
    "f /srv/immich/thumbs/.immich 0664 root srv - -"
    "f /srv/immich/encoded-video/.immich 0664 root srv - -"
    "f /srv/immich/profile/.immich 0664 root srv - -"
    "f /srv/immich/backups/.immich 0664 root srv - -"

    "d /srv/images 2775 root srv -"
    "d /srv/images/irl 2775 root srv -"
    "d /srv/images/photography 2775 root srv -"
    "d /srv/images/art 2775 root srv -"
    "d /srv/images/wallpapers 2775 root srv -"
    "d /srv/images/graphics 2775 root srv -"
    "d /srv/images/screenshots 2775 root srv -"
    "d /srv/images/memes 2775 root srv -"

    "d /srv/shared 2775 root srv -"
    "d /srv/shared/uni 2775 root srv -"
    "d /srv/shared/notes 2775 root srv -"
    "d /srv/shared/music 2775 root srv -"

    "d /srv/uploads 3775 root srv -"
  ];
}
