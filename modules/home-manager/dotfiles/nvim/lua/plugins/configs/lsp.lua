local M = {}

M.get_servers = function()
  return {
    nixd = {
      settings = {
        nixd = {
          nixpkgs = {
            expr = "import <nixpkgs> { }",
          },
        },
      },
    },
    lua_ls = {
      settings = {
        Lua = {
          workspace = {
            library = { vim.env.VIMRUNTIME },
          },
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    },
    zls = {
      settings = {
        zls = {
          enable_build_on_save = true,
        },
      },
    },
    terraformls = true,
    yamlls = true,
    ccls = true,
    ts_ls = true,
  }
end

return M
