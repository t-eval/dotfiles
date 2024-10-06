{ lib, config, ... }:
with lib;
let cfg = config.home.obsidian;
in {
  options = {
    home.obsidian = {
      enable = mkEnableOption "Whether to enable obsidian";
      workspaces = mkOption {
        type = with types;
          listOf (submodule {
            options = {
              name = mkOption {
                type = str;
                description = "Which name for the Obsidian workspace";
              };
              path = mkOption {
                type = str;
                description = "Which path for the Obsidian workspace";
              };
            };
          });
        description = "Obsidian workspaces";
      };
    };
  };

  config = mkIf cfg.enable {
    programs.nixvim.plugins.obsidian = {
      enable = true;
      settings = {
        completion = {
          min_chars = 2;
          nvim_cmp = true;
        };
        templates.subdir = "templates";
        picker.name = "telescope.nvim";
        mappings = {
          "<leader>fn" = {
            action = "require('obsidian').util.gf_passthrough";
            opts = {
              buffer = true;
              expr = true;
              noremap = false;
            };
          };
        };
        ui.enable = false;
        workspaces = cfg.workspaces;
        yaml_parser = "native";
      };
    };
  };
}
