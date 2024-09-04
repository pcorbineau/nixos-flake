{ pkgs, config, lib, ...}:
{
  home.file = {
    ".config/sway/config".source = config.lib.file.mkOutOfStoreSymlink /home/pcorbineau/Documents/nixos-flake/sway/config;
    };
  home.file = {
    ".config/waybar/config".source = config.lib.file.mkOutOfStoreSymlink /home/pcorbineau/Documents/nixos-flake/waybar/config;
    };
  home.file = {
    ".config/wofi/style.css".source = config.lib.file.mkOutOfStoreSymlink /home/pcorbineau/Documents/nixos-flake/wofi/style.css;
    };
  home.file = {
    ".config/wofi/config".source = config.lib.file.mkOutOfStoreSymlink /home/pcorbineau/Documents/nixos-flake/wofi/config;
    };

  #programs.wofi.enable = true;

  #programs.waybar = {
  #  enable = true;
  #  style = ''
  #  * {
  #  font-family: "JetBrainMono Nerd Font";
  #  font-size: 12pt;
  #  }
  #  '';
  #  settings = [
  #  {
  #  layer= "top";
  #  modules-left = ["sway/workspaces"  "sway/mode"];
  #  modules-center = ["sway/window"];
  #  modules-right = ["battery"  "clock"];
  #  "sway/window" = {
  #      max-length = 50;
  #  };
  #  battery = {
  #      format = "{capacity}% {icon}";
  #      format-icons = [""  ""  ""  ""  ""];
  #  };
  #  clock = {
  #      format-alt = "{:%a  %d. %b  %H:%M}";
  #  };
  #  }
  #  ];
  #};
}
