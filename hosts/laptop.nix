{ config, pkgs, unstable, ... }: {
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # automatic updating
  system.autoUpgrade.enable = true;
  system.autoUpgrade.dates = "weekly";

  # automatic cleanup
  nix.gc.automatic = true;
  nix.gc.dates = "daily";
  nix.gc.options = "--delete-older-than 10d";
  nix.settings.auto-optimise-store = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "mixos"; # Define your hostname.
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  services.avahi = {
    enable = true;
    publish.enable = true;
  };

  # locale
  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_CA.UTF-8";

  # fcitx5-mozc
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-mozc-ut
      fcitx5-gtk
    ];
  };

  users.users.yuni = {
    isNormalUser = true;
    description = "yuni";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
    # shell = pkgs.zsh;
    packages = with pkgs; [ ];
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # system
    nh
    nix-index
    xwayland-satellite
    brightnessctl
    # alacritty
    # ghostty 
    kitty
    fastfetch
    hyfetch
    # waybar
    # waybar-mpris
    # swww
    # wofi
    # fuzzel
    # nwg-bar
    jq
    # dunst
    libnotify
    wl-clipboard starship xdg-desktop-portal-wlr
    kdePackages.xdg-desktop-portal-kde
    # nushell
    # dwm
    # dmenu
    # st

    # util
    # zsh-autosuggestions
    # zsh-syntax-highlighting
    vim
    neovim
    # vscode
    git
    tmux
    btop
    zoxide
    eza
    fd
    ripgrep
    fzf
    curl
    ffmpeg
    nautilus
    stow
    yt-dlp
    # virtualbox
    # remmina

    # development
    gcc  # also g++?
    clang
    cmake
    gnumake
    ninja
    python3
    nodejs
    rustup
    jre8
    jre17_minimal
    # quartus-prime-lite
    pastel

    # productivity
    obsidian
    discord
    zellij
    qbittorrent
    vlc
    spotify
    cmus
    rmpc
    mpd
    libreoffice
    cloudflared
    # pom
    # ticktick
    # anki

    # multimedia
    # deadbeef
    # obs
    # kicad
    # kdenlive
    # lmms
    audacity

    # games
    # steam-run
    prismlauncher
    osu-lazer-bin
    # taisei

    # fun
    cava
    tty-clock
    cmatrix
    cbonsai
    pipes
    figlet
  ];

  # List services that you want to enable:

  # enable X11
  services.xserver.enable = true;

  # login
  # services.displayManager.ly.enable = true;
  services.displayManager.sddm = {
    enable = true;
    theme = "breeze";
    settings = {
      Theme = {
        Background = "~/Pictures/wallpapers/20250928_134631.jpg"; # [!] broken
      };
    };
  };


  # enable KDE Plasma
  services.desktopManager.plasma6.enable = true;

  # enable hyprland
  # programs.hyprland.enable = true;
  # programs.hyprland.portalPackage = pkgs.xdg-desktop-portal-hyprland;

  # enable niri
  programs.niri.enable = true;

  # enable dwm
  # services.xserver.windowManager.dwm.enable = true;

  # WM services
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      # kdePackages.xdg-desktop-portal-kde
    ];
  };
  # programs.hyprlock.enable = true;

  # shell
  # programs.zsh.enable = true;
  # programs.zsh.ohMyZsh.enable = true;
  programs.fish.enable = true;

  # power saving
  services.power-profiles-daemon.enable = false;
  services.tlp.enable = true;

  # server/sync
  services.syncthing.enable = true;
  programs.localsend.enable = true;

  # other
  services.flatpak.enable = true;
  programs.steam.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # nix-ld
  # programs.nix-ld.enable = true;
  # programs.nix-ld.libraries = with pkgs; [
  #     zlib
  #     openssl
  #     libgcc
  #     # libstdcxx
  #     xorg.libX11
  #     xorg.libxcb
  #     libxkbcommon
  #     mesa
  #     libglvnd
  #     fuse
  #     alsa-lib
  #     wineWowPackages.stable
  #     winetricks
  #     wineWowPackages.waylandFull
  # ];

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 53317 ];
  networking.firewall.allowedUDPPorts = [ 5353 53317 ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;



  fileSystems."/mnt/win11" = {
    device = "/dev/disk/by-uuid/6A4A1ED74A1E9FBD";
    fsType = "ntfs3";
    options = [ "rw" "uid=1000" "gid=100" "dmask=022" "fmask=133" ];
  };

  # environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
