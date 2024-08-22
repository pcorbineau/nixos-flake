{inputs, config, pkgs, ...}: {
  home.username = "pcorbineau";
  home.homeDirectory = "/home/pcorbineau";

  imports = [
    ./hypr
  ];

  home.packages = with pkgs; [
    fastfetch
    vim
  ];

  home.stateVersion = "24.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.firefox = {
    enable = true;
    profiles = {
      default = {
        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
        ];
        search.default = "DuckDuckGo";
      };
    };
  };

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium.fhs;
  };
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      local config = {}
      config.font = wezterm.font 'JetBrains Mono'
      return config
    '';
  };

  fonts.fontconfig.enable = true;
  # home.packages = [
  #   (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  # ];
}
