{...}: let
  common_picker = {
    theme = "ivy";
    disable_devicons = true;
  };
in {
  programs.nixvim.plugins = {
    web-devicons.enable = false;

    telescope = {
      enable = true;
      autoLoad = true;

      keymaps = {
        "<leader>fw" = "live_grep";
        "<leader>fd" = "find_files";
        "<leader>fg" = "git_files";
        "<leader>fb" = "git_branches";
      };

      luaConfig.post = ''
        vim.api.nvim_create_autocmd('LspAttach', {
          group = vim.api.nvim_create_augroup('UserLspConfig', { clear = true }),
          callback = function(ev)
            local bufopts = { noremap = true, silent = true, buffer = ev.buf }

            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>gd", builtin.lsp_definitions, bufopts)
            vim.keymap.set("n", "<leader>gr", builtin.lsp_references, bufopts)
          end
        })
      '';

      extensions = {
        fzf-native = {
          enable = true;
          settings = {
            fuzzy = true;
            case_mode = "smart_case";
          };
        };
      };

      settings = {
        pickers = {
          find_files = common_picker;
          git_files = common_picker;
          live_grep = common_picker;
          lsp_references = common_picker;
          diagnostics = common_picker;
        };
      };
    };
  };
}
