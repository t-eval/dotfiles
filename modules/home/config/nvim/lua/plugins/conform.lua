return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      haskell = { "hindent" },
      nix = { "nixfmt" },
      zig = { "zigfmt" },
      c = { "clang-format" },
      cpp = { "clang-format" },
      yaml = { "yamlfix" },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
  },
}
