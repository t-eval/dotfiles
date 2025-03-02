{
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.coding.nvim;
in {
  options = {
    coding.nvim = with types; {
      enable = mkEnableOption "nvim";
    };
  };

  config = mkIf cfg.enable {
    programs.nixvim = {
      enable = true;
      enableMan = true;

      viAlias = true;
      vimAlias = true;

      extraPackages = with pkgs; [ripgrep alejandra];

      colorschemes.gruvbox = {
        enable = true;
        autoLoad = true;

        settings = {
          transparent_mode = true;
          contrast = "hard";
        };
      };
    };
  };

  imports = [./core ./plugins];
}
