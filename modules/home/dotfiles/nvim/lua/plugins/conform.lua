return {
  "stevearc/conform.nvim",
  opts = {
    formatters = {
      yamlfix = {
        env = {
          YAMLFIX_WHITELINES = 1,
        },
      },
    },
    formatters_by_ft = {
      lua = { "stylua" },
      nix = { "alejandra" },
      zig = { "zigfmt" },
      c = { "clang-format" },
      cpp = { "clang-format" },
      yaml = { "yamlfix" },
      terraform = { "terraform_fmt" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
  },
}
