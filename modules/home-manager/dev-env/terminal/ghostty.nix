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
      ghostty = mkEnableOption "ghostty";
    };
  };

  config = lib.mkIf cfg.ghostty {
    # home.packages = [ghostty.packages.${system}.default]; Waiting for ghostty flake to be available on macos

    xdg.configFile."ghostty/config".text = ''
      background = 111111
      background-opacity = 0.7
      background-blur-radius = 20
      foreground = ffffff

      font-family = Berkeley Mono
      font-style = Bold
      font-style-italic = Bold Italic
      font-size = 13
      font-thicken = true

      window-padding-balance = true
      window-decoration = true
      window-width = 3000
      window-height = 3000
    '';
  };
}
