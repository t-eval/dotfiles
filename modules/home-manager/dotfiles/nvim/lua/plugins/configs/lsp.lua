local M = {}

---@return string[]
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
    yamlls = true,
    glsl_analyzer = true,
    ccls = true,
    ts_ls = true,
  }
end

return M
