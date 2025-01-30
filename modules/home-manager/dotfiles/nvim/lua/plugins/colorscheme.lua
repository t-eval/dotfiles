return {
  {
    "rebelot/kanagawa.nvim",
    enabled = true,
    init = function()
      vim.cmd.colorscheme("kanagawa")
    end,
    opts = {
      transparent = true,
      theme = "dragon",
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none",
              float = {
                bg = "none",
              },
            },
          },
        },
      },
    },
  },
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
    enabled = false,
    init = function()
      vim.cmd("colorscheme gruvbox")
    end,
    opts = {
      terminal_colors = true,
      contrast = "hard",
      transparent_mode = true,
      overrides = {
        SignColumn = { bg = "NONE" },
      },
    },
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    enabled = false,
    init = function()
      vim.cmd("colorscheme rose-pine")
    end,
    opts = {
      variant = "main",
      dark_variant = "main",
      extend_background_behind_borders = true,
      styles = {
        transparency = true,
      },
    },
  },
}
