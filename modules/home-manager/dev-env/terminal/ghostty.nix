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
      ghostty = mkEnableOption "Whether to enable ghostty terminal";
    };
  };

  config = lib.mkIf cfg.ghostty {
    # home.packages = [ghostty.packages.${system}.default]; Waiting for ghostty flake to be available on macos

    xdg.configFile."ghostty" = {
      source = ../../dotfiles/ghostty;
      recursive = true;
    };
  };
}
