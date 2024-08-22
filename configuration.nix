{inputs, config, pkgs, ...}: {

    imports = [ ./hardware-configuration.nix ];
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    system.stateVersion = "24.05";

    networking.hostName = "nixos"; # Define your hostname.

    # Enable networking
    networking.networkmanager.enable = true;

    # Set your time zone.
    time.timeZone = "Europe/Paris";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
        LC_ADDRESS = "fr_FR.UTF-8";
        LC_IDENTIFICATION = "fr_FR.UTF-8";
        LC_MEASUREMENT = "fr_FR.UTF-8";
        LC_MONETARY = "fr_FR.UTF-8";
        LC_NAME = "fr_FR.UTF-8";
        LC_NUMERIC = "fr_FR.UTF-8";
        LC_PAPER = "fr_FR.UTF-8";
        LC_TELEPHONE = "fr_FR.UTF-8";
        LC_TIME = "fr_FR.UTF-8";
    };


    users.users.pcorbineau = {
        isNormalUser = true;
        description = "Paul Corbineau";
        home = "/home/pcorbineau";
        extraGroups = [ "wheel" "networkmanager" ];
    };

    services.xserver = {
        enable = true;
        xkb.layout = "us";
    };
    services.displayManager.sddm = {
        enable = true;
        wayland.enable = true;
    };

    programs.hyprland.enable = true;
    services.desktopManager.plasma6.enable = true;

    virtualisation.vmVariant = {
          environment.sessionVariables = {
            # WLR_RENDERER_ALLOW_SOFTWARE = "1";
        };
        users.users.pcorbineau.password = "test";
    };

      # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  
}
