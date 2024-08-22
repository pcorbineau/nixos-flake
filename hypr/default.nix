{
   wayland.windowManager.hyprland = {
    enable = true;
    settings.source = "~/.config/hypr/myconf.conf";
    };

    home.file = {
        ".config/hypr/myconf.conf".source = ./hyprland.conf;
    };
}
