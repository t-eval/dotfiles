return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local lsp = require("lspconfig")
    local lsp_configs = require("plugins.configs.lsp")

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local on_attach = function(_, bufnr)
      local bufopts = { noremap = true, silent = true, buffer = bufnr }

      -- Telescope/LSP keymaps
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>gd", builtin.lsp_definitions, bufopts)
      vim.keymap.set("n", "<leader>gr", builtin.lsp_references, bufopts)

      -- LSP keymaps
      vim.keymap.set("n", "<leader>K", vim.lsp.buf.hover, bufopts)
      vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, bufopts)
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
      vim.keymap.set("n", "<leader>ct", vim.lsp.buf.type_definition, bufopts)
    end

    vim.diagnostic.config({ virtual_text = false, virtual_lines = false })

    local servers = lsp_configs.get_servers()

    for name, config in pairs(servers) do
      if config == true then
        config = {}
      end

      config = vim.tbl_deep_extend(
        "force",
        {},
        { capabilities = capabilities, on_attach = on_attach },
        config
      )

      lsp[name].setup(config)
    end
  end,
}
