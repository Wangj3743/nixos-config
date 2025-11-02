{ config, pkgs, ... }: {
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    imports =
    [
        ./hardware-configuration.nix
        ./users.nix
        ./packages.nix
    ];

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
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Enable networking
    networking.networkmanager.enable = true;

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

    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    # programs.mtr.enable = true;
    # programs.gnupg.agent = {
    #   enable = true;
    #   enableSSHSupport = true;
    # };

    services.displayManager.sddm = {
      enable = true;
      theme = "breeze";
      settings = {
        Theme = {
          Background = "~/Pictures/wallpapers/20250928_134631.jpg"; # [!] broken
        };
      };
    };

    # List services that you want to enable:

    # Enable the OpenSSH daemon.
    services.openssh.enable = true;

    # Open ports in the firewall.
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];
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
