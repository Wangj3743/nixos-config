{ config, pkgs, ... }: {
    # enable X11
    services.xserver.enable = true;

    # enable KDE Plasma
    services.displayManager.sddm.enable = true;
    services.desktopManager.plasma6.enable = true;

    # enable hyprland
    programs.hyprland.enable = true;
    # programs.hyprland.withUWSM = false;
    # programs.uwsm.enable = true;
    # programs.uwsm.waylandCompositors = "hyprland";  # this line is wrong

    # enable niri
    programs.niri.enable = true;

    # WM services
    services.displayManager.ly.enable = false;
    programs.hyprlock.enable = true;

    # shell
    programs.zsh.enable = true;
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
        fish
        oh-my-zsh
        alacritty
        ghostty
        kitty
        fastfetch
        hyfetch
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
