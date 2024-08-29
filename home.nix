{inputs, config, pkgs, ...}: {
  home.username = "pcorbineau";
  home.homeDirectory = "/home/pcorbineau";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  imports = [
    ./sway
  ];

  home.packages = with pkgs; [
    fastfetch
    vim
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  home.stateVersion = "24.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  fonts.fontconfig.enable = true;

  programs.git.enable = true;
  programs.neovim.enable = true;

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
      config.window_decorations = "NONE"
      config.enable_tab_bar = false
      return config
    '';
  };

  programs.zsh = {
    enable = true;
  };
  programs.oh-my-posh = {
    enable = true;
    useTheme = "amro";
  };

  programs.lazygit.enable = true;
}
