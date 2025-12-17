{ config, pkgs, ... }: {
    # enable X11
    services.xserver.enable = true;

    # login
    # services.displayManager.ly.enable = true;
    services.displayManager.sddm.enable = true;

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
    programs.hyprlock.enable = true;

    # shell
    # programs.zsh.enable = true;
    # programs.zsh.ohMyZsh.enable = true;
    programs.fish.enable = true;

    # power saving
    services.power-profiles-daemon.enable = false;
    services.tlp.enable = true;

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

    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
        # FHS
        # (
        #   let
        #     base = pkgs.appimageTools.defaultFhsEnvArgs;
        #   in
        #   pkgs.buildFHSEnv (
        #     base
        #     // {
        #       name = "fhs";
        #       targetPkgs =
        #         pkgs:
        #         (base.targetPkgs pkgs)
        #         ++ (with pkgs; [
        #           pkg-config
        #           wineWow64Packages.wayland
        #         ]);
        #       profile = "export FHS=1";
        #       runScript = "zsh";
        #       extraOutputsToInstall = [ "dev" ];
        #     }
        #   )
        # )

        # nix-ld
        # with pkgs; let
        #     # The rest of my packages
        #
        #     libraries = [
        #         libGL
        #         glfw3-minecraft
        #         libpulseaudio
        #     ];
        # in {
        #     # Other code here
        #
        #     programs.nix-ld = {    
        #         enable = true;
        #         inherit libraries;
        #     };
        #     environment.variables.LD_LIBRARY_PATH = lib.makeLibraryPath libraries;
        # }

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
        waybar
        waybar-mpris
        swww
        # wofi
        fuzzel # nwg-bar
        jq
        dunst
        libnotify
        wl-clipboard
        starship
        xdg-desktop-portal-wlr
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
        syncthing
        localsend
        zellij
        qbittorrent
        vlc
        pom
        spotify
        cmus
        rmpc
        mpd
        libreoffice
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
}
