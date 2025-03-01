return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  main = "nvim-treesitter.configs",
  opts = {
    ensure_installed = {
      "lua",
      "nix",
      "cmake",
      "c",
      "zig",
      "yaml",
      "typescript",
      "terraform",
      "html",
      "json",
    },

    auto_install = false,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  },
}
