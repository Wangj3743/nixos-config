{ config, pkgs, ... }:

{
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # TEMP
    nixpkgs.config.allowBroken = true;

    # automatic updating
    system.autoUpgrade.enable = true;
    system.autoUpgrade.dates = "weekly";

    # automatic cleanup
    nix.gc.automatic = true;
    nix.gc.dates = "daily";
    nix.gc.options = "--delete-older-than 10d";
    nix.settings.auto-optimise-store = true;

    imports =
    [
        ./hardware-configuration.nix
        ./users.nix
    ];

    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.hostName = "mixos"; # Define your hostname.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Enable networking
    networking.networkmanager.enable = true;

    # Set your time zone.
    time.timeZone = "America/Toronto";

    # Select internationalisation properties.
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

    # Enable the X11 windowing system.
    # You can disable this if you're only using the Wayland session.
    services.xserver.enable = true;

    # Enable the KDE Plasma Desktop Environment.
    services.displayManager.sddm.enable = true;
    services.desktopManager.plasma6.enable = true;

    # Enable hyprland
    services.displayManager.ly.enable = false;
    programs.hyprland.enable = true;
    # programs.hyprland.withUWSM = false;
    # programs.uwsm.enable = true;
    # programs.uwsm.waylandCompositors = "hyprland";  # this line is wrong

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
        #jack.enable = true;

        # use the example session manager (no others are packaged yet so this is enabled by default,
        # no need to redefine it in your config for now)
        #media-session.enable = true;
    };

    # Enable touchpad support (enabled default in most desktopManager).
    # services.xserver.libinput.enable = true;

    programs.zsh.enable = true;
    programs.fish.enable = true;
    programs.steam.enable = true;

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
        # system
        nh
        fish
        oh-my-zsh
        alacritty
        ghostty
        kitty
        fastfetch
        hyfetch
        wofi

        # util
        vim
        neovim
        git
        tmux
        btop
        wine
        zoxide
        eza
        fd
        ripgrep
        fzf
        curl
        ffmpeg
        dmidecode

        # development
        gcc  # also g++?
        clang
        cmake
        gnumake
        ninja
        python3
        nodejs
        rustup

        # productivity
        floorp
        obsidian
        discord
        syncthing
        localsend
        zellij
        qbittorrent
        vlc
        libreoffice
        ticktick
        anki

        # multimedia
        # obs
        # kicad
        # kdenlive
        # lmms
        # audacity

        # games
        minecraft
        steam
        steam-run
        osu-lazer
        taisei

        # fun
        cava
        cmatrix
        bsdgames
    ];

    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    # programs.mtr.enable = true;
    # programs.gnupg.agent = {
    #   enable = true;
    #   enableSSHSupport = true;
    # };

    # List services that you want to enable:

    # Enable the OpenSSH daemon.
    services.openssh.enable = true;

    # Open ports in the firewall.
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    # networking.firewall.enable = false;

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "25.05"; # Did you read the comment?

}
