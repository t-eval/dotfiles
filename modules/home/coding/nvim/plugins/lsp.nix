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

    servers = {
      nixd = {
        enable = true;
        autostart = true;
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
    };
  };
}
