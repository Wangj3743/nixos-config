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
    programs.zsh.enable = true;
    programs.zsh.ohMyZsh.enable = true;
    # programs.fish.enable = true;

    # other
    programs.steam.enable = true;

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
        # FHS
        (
          let
            base = pkgs.appimageTools.defaultFhsEnvArgs;
          in
          pkgs.buildFHSEnv (
            base
            // {
              name = "fhs";
              targetPkgs =
                pkgs:
                (base.targetPkgs pkgs)
                ++ (with pkgs; [
                  pkg-config
                  wineWow64Packages.wayland
                ]);
              profile = "export FHS=1";
              runScript = "zsh";
              extraOutputsToInstall = [ "dev" ];
            }
          )
        )

        # system
        nh
        xwayland-satellite
        brightnessctl
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
        wl-clipboard
        starship
        xdg-desktop-portal-wlr
        kdePackages.xdg-desktop-portal-kde
        dwm
        dmenu st

        # util
        vim
        neovim
        vscode
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
        osu-lazer-bin
        taisei

        # fun
        cava
        cmatrix
    ];
}
