return {
  {
    "rebelot/kanagawa.nvim",
    enabled = true,
    priority = 1000,
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
}
