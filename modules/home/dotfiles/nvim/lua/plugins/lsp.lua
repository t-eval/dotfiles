return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "nvim-telescope/telescope.nvim",
    { "j-hui/fidget.nvim", opts = {} },
  },
  config = function()
    require("plugins.configs.lsp_config")
  end,
}
