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
      vim.cmd("colorscheme gruvbox")
    end,
    opts = {
      terminal_colors = true,
      contrast = "hard",
      transparent_mode = false,
      overrides = {
        SignColumn = { bg = "NONE" },
      },
    },
  },
}
