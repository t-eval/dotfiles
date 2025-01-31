return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      nix = { "alejandra" },
      zig = { "zigfmt" },
      c = { "clang-format" },
      cpp = { "clang-format" },
      yaml = { "yamlfix" },
      terraform = { "terraform_fmt" },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
  },
}
