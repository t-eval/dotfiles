return {
  "stevearc/oil.nvim",
  keys = {
    { "-", "<cmd>Oil<cr>", desc = "Open Oil" },
  },
  opts = {
    view_options = {
      show_hidden = true,
      is_always_hidden = function(name, _)
        local ignores = {
          -- Default files
          ".",
          "../",

          -- C files
          "CMakeLists.txt.user",
          "CMakeCache.txt",
          "CMakeFiles",
          "CMakeScripts",
          "Testing",
          "cmake_install.cmake",
          "install_manifest.txt",
          "compile_commands.json",
          "CTestTestfile.cmake",
          "_deps",
          "CMakeUserPresets.json",
          ".cache",
        }

        return vim.tbl_contains(ignores, name)
      end,
    },
  },
}
