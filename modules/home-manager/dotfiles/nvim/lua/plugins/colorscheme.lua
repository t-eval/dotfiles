return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  init = function()
    vim.o.background = "dark"
    vim.cmd([[colorscheme gruvbox]])
  end,
  opts = {
    transparent_mode = true,
    contrast = "hard",
    overrides = {
      Function = { fg = "#fabd2f" },
    },
  },
}
