{
   wayland.windowManager.sway = {
    enable = true;
    config = {
      modifier = "Mod4";
      # Use wezterm as default terminal
      terminal = "wezterm"; 
      menu = "wofi --show drun";
      input = {
        "*" = {
          tap = "enabled";
        };
      };
      output = {
        eDP-1 = {
	  scale = "1.25";
	};
      };
    };
  };

  programs.wofi.enable = true;
}
