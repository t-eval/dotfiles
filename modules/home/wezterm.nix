{ ... }: {

  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
  };

  xdg.configFile."wezterm" = {
    source = ./config/wezterm;
    recursive = true;
  };
}
