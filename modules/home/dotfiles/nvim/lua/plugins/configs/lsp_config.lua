local lsp = require("lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

vim.diagnostic.config({ virtual_text = true, virtual_lines = true })

local servers = {
  nixd = {
    settings = {
      nixd = {
        nixpkgs = {
          expr = "import <nixpkgs> { }",
        },
      },
    },
  },
  lua_ls = {
    settings = {
      Lua = {
        completion = {
          callSnippet = "Both",
        },
        workspace = {
          library = { vim.env.VIMRUNTIME },
        },
        diagnostics = {
          globals = { "vim" },
        },
      },
    },
  },
  zls = {
    settings = {
      zls = {
        enable_build_on_save = true,
      },
    },
  },
  terraformls = {},
  yamlls = {},
  ccls = {},
  ts_ls = {},
}

local on_attach = function(_, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  local map = vim.keymap.set
  local lsp_buf = vim.lsp.buf

  -- Telescope/LSP keymaps
  local builtin = require("telescope.builtin")
  map("n", "<leader>gd", builtin.lsp_definitions, bufopts)
  map("n", "<leader>gr", builtin.lsp_references, bufopts)

  -- LSP keymaps
  map("n", "<leader>K", lsp_buf.hover, bufopts)
  map("n", "<leader>cr", lsp_buf.rename, bufopts)
  map("n", "<leader>ca", lsp_buf.code_action, bufopts)
  map("n", "<leader>ct", lsp_buf.type_definition, bufopts)
end

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

-- LSP settings (for overriding per client)
local handlers = {
  ["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover,
    { border = border, max_width = 80 }
  ),
  ["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    { border = border, max_width = 80 }
  ),
}

for name, config in pairs(servers) do
  lsp[name].setup({
    settings = config.settings,
    on_attach = on_attach,
    capabilities = capabilities,
    handlers = handlers,
  })
end
