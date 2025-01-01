{ ... }: {

  programs.wezterm = {
    enable = false;
    enableZshIntegration = true;
  };

  xdg.configFile."wezterm" = {
    source = ./config/wezterm;
    recursive = true;
  };
}
