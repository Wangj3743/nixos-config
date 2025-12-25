{ config, pkgs, unstable, ... }: {
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # networking
  networking.networkmanager.enable = true;

  # locale
  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_CA.UTF-8";

  # users
  users.users.yuni = {
    isNormalUser = true;
    description = "yuni";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
    packages = with pkgs; [];
  };

  # packages
  environment.systemPackages = with pkgs; [
    # system
    nh
    nix-index
    brightnessctl
    libnotify

    # utils
    vim
    git
    curl
    zoxide
    fd
    ripgrep

    # tools
    zellij
    btop
    fastfetch
  ];

  # fish shell
  programs.fish.enable = true;

  # tlp
  services.power-profiles-daemon.enable = false;
  services.tlp.enable = true;

  # syncthing + localsend
  services.syncthing.enable = true;
  programs.localsend.enable = true;

  # allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # enable the OpenSSH daemon
  services.openssh.enable = true;

  # open ports in the firewall (for localsend)
  networking.firewall.allowedTCPPorts = [ 53317 ];
  networking.firewall.allowedUDPPorts = [ 5353 53317 ];
}
