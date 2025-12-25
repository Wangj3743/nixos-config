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

      ExecStart = "${pkgs.copyparty}/bin/copyparty";

      Restart = "on-failure";
    };
  };

  # DIRECTORIES
  systemd.tmpfiles.rules = [
    "d /srv 2775 root srv -"
    "d /srv/docs 2775 root srv -"
    "d /srv/projects 2775 root srv -"
    "d /srv/games 2775 root srv -"
    "d /srv/dumps 2775 root srv -"

    "d /srv/media 2775 root srv -"
    "d /srv/media/music 2775 root srv -"
    "d /srv/media/movies 2775 root srv -"
    "d /srv/media/tv 2775 root srv -"

    "d /srv/images 2775 root srv -"
    "d /srv/images/camera 2775 root srv -"
    "d /srv/images/camera/videos 2775 root srv -"
    "d /srv/images/memes 2775 root srv -"
    "d /srv/images/art 2775 root srv -"
    "d /srv/images/graphics 2775 root srv -"
    "d /srv/images/videos 2775 root srv -"

    "d /srv/shared 2775 root srv -"
    "d /srv/shared/uni 2775 root srv -"
    "d /srv/shared/notes 2775 root srv -"
    "d /srv/shared/music 2775 root srv -"
  ];
}
