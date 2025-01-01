return {
  {
    "tjdevries/colorbuddy.nvim",
    enabled = false,
    priority = 1000,
    init = function()
      vim.cmd.colorscheme("gruvbuddy")
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    init = function()
      vim.o.background = "dark"
      vim.cmd("colorscheme gruvbox")
    end,
    opts = {
      contrast = "hard",
      overrides = {
        SignColumn = { bg = "NONE" },
      },
    },
  },
}
