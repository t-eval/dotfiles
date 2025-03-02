{...}: {
  programs.nixvim.plugins.none-ls = {
    enable = true;
    autoLoad = true;
    enableLspFormat = false;

    settings = {
      on_attach = ''
        function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format()
              end
            })
          end
        end
      '';
    };

    sources = {
      formatting = {
        alejandra.enable = true;
      };
    };
  };
}
