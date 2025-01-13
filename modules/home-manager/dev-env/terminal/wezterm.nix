{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.dev-env.terminal;
in {
  options = {
    dev-env.terminal = {
      wezterm = mkEnableOption "wezterm";
    };
  };

  config = lib.mkIf cfg.wezterm {
    programs.wezterm = {
      enable = false;
      enableZshIntegration = true;
    };

    xdg.configFile."wezterm" = {
      source = ../../dotfiles/wezterm;
      recursive = true;
    };
  };
}
