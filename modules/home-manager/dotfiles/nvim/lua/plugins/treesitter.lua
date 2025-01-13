return {
  "nvim-treesitter/nvim-treesitter",
  priority = 1000,
  build = ":TSUpdate",
  main = "nvim-treesitter.configs",
  opts = {
    ensure_installed = {
      "lua",
      "nix",
      "zig",
      "haskell",
      "cmake",
      "c",
      "cpp",
      "yaml",
      "glsl",
      "markdown",
      "markdown_inline",
    },

    auto_install = false,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  },
}
