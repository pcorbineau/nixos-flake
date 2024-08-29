{ pkgs, ...}:
{
   wayland.windowManager.sway = {
    enable = true;
    checkConfig = false;
    package = pkgs.swayfx;
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
	  bg = "${../wallpaper/glacier.jpg} fill";
	};
      };
      bars = [
        {
	  command = "${pkgs.waybar}/bin/waybar";
	}
      ];
      window.titlebar = false;
      gaps.inner = 10;
    };
    extraConfig = ''
    corner_radius 10

    blur enable
    '';
  };

  programs.wofi.enable = true;
  programs.waybar = {
    enable = true;
    style = ''
    * {
    font-family: "JetBrainMono Nerd Font";
    font-size: 12pt;
    }
    '';
    settings = [
    {
    layer= "top";
    modules-left = ["sway/workspaces"  "sway/mode"];
    modules-center = ["sway/window"];
    modules-right = ["battery"  "clock"];
    "sway/window" = {
        max-length = 50;
    };
    battery = {
        format = "{capacity}% {icon}";
        format-icons = [""  ""  ""  ""  ""];
    };
    clock = {
        format-alt = "{:%a  %d. %b  %H:%M}";
    };
    }
    ];
  };
}
