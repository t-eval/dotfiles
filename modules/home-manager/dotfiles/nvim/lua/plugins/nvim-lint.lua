return {
  "mfussenegger/nvim-lint",
  config = function()
    local linters = require("lint")
    linters.linters_by_ft = {
      typescript = { "eslint" },
      typescript_react = { "eslint" },
      c = { "clangtidy" },
      lua = { "luac" },
    }

    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        linters.try_lint()
      end,
    })
  end,
}
