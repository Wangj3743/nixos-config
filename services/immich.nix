{ config, pkgs, ... }: {
  # CONFIG
  services.immich = {
    enable = true;
    openFirewall = false;
  };
}
