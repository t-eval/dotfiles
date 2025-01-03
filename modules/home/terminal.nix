{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.home.terminal;
in {
  options = {
    home.terminal = {
      ghostty = mkEnableOption "ghostty";
      wezterm = mkEnableOption "wezterm";
    };
  };

  config = {
    # Wezterm
    programs.wezterm = lib.mkIf cfg.wezterm {
      enable = false;
      enableZshIntegration = true;
    };

    xdg.configFile."wezterm" = lib.mkIf cfg.wezterm {
      source = ./config/wezterm;
      recursive = true;
    };

    # Ghostty
    xdg.configFile."ghostty" = lib.mkIf cfg.ghostty {
      source = ./config/ghostty;
      recursive = true;
    };
  };
}
