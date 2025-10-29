{ config, pkgs, ... }: {
    # enable X11
    services.xserver.enable = true;

    # login
    services.displayManager.sddm.enable = true;
    # services.displayManager.ly.enable = true;

    # enable KDE Plasma
    services.desktopManager.plasma6.enable = true;

    # enable hyprland
    # programs.hyprland.enable = true;

    # enable niri
    programs.niri.enable = true;

    # WM services
    programs.hyprlock.enable = true;

    # shell
    programs.zsh.enable = true;
    programs.zsh.ohMyZsh.enable = true;
    programs.fish.enable = true;

    # other
    programs.steam.enable = true;

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
        # system
        nh
        xwayland-satellite
        alacritty
        ghostty
        kitty
        fastfetch
        hyfetch
        waybar
        waybar-mpris
        swww
        wofi
        fuzzel
        nwg-bar
        jq
        dunst
        libnotify
        slurp
        grim
        wl-clipboard
        starship


        # util
        vim
        neovim
        vscode
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
        fprintd
        usbutils
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
        deadbeef
        # obs
        # kicad
        # kdenlive
        # lmms
        # audacity

        # games
        steam
        steam-run
        # minecraft  # nixpkgs.config.allowBroken = true;
        prismlauncher
        osu-lazer
        taisei

        # fun
        cava
        cmatrix
        bsdgames
    ];
}
