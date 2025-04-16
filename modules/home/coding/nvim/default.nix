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

      diagnostics = {
        virtual_text = true;
        signs = true;
        underline = false;
        virtual_lines = false;
      };

      colorschemes = {
        rose-pine = {
          enable = true;
          autoLoad = true;

          settings = {
            variant = "main";
            dark_variant = "main";
            extend_background_behind_borders = true;
            styles = {
              bold = true;
              italic = true;
              transparency = true;
            };
          };
        };

        gruvbox = {
          enable = false;
          autoLoad = true;

          settings = {
            contrast = "hard";
            transparent_mode = true;
            terminal_colors = true;
          };
        };
      };
    };
  };

  imports = [./core ./plugins];
}
