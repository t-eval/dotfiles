{...}: {
  programs.nixvim.plugins.lsp = {
    enable = true;
    autoLoad = true;

    keymaps = {
      lspBuf = {
        "<leader>K" = "hover";
        "<leader>cr" = "rename";
        "<leader>ca" = "code_action";
        "<leader>ct" = "type_definition";
      };
      silent = true;
    };

    luaConfig.pre = ''
      local border = {
        { "┌", "FloatBorder" },
        { "─", "FloatBorder" },
        { "┐", "FloatBorder" },
        { "│", "FloatBorder" },
        { "┘", "FloatBorder" },
        { "─", "FloatBorder" },
        { "└", "FloatBorder" },
        { "│", "FloatBorder" },
      }

      local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
      function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
        opts = opts or {}
        opts.border = opts.border or border
        return orig_util_open_floating_preview(contents, syntax, opts, ...)
      end
    '';

    servers = {
      nixd = {
        enable = true;
        settings = {
          nixpkgs = {
            expr = "import <nixpkgs> { }";
          };
          options = {
            "nix-darwin" = {
              expr = "(builtins.getFlake \"/Users/void/git/dotfiles\").darwinConfigurations.personal.options";
            };
          };
        };
      };
      clangd = {
        enable = true;
        package = null;
      };
      zls = {
        enable = true;
        package = null;
        settings = {
          zls = {
            enable_build_on_save = true;
          };
        };
      };
    };
  };
}
