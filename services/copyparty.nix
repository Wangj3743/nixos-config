{ config, pkgs, ... }: {
  systemd.services.copyparty = {
    description = "Copyparty File Server";
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ];

    serviceConfig = {
      Type = "simple";
      User = "yuni";
      Group = "users";

      WorkingDirectory = "/home/yuni/copyparty";

      ExecStart = "${pkgs.copyparty}/bin/copyparty";

      Restart = "on-failure";
    };
  };
}
