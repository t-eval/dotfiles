return {
  "epwalsh/obsidian.nvim",
  version = "*",
  enabled = false,
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "MeanderingProgrammer/render-markdown.nvim",
      dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "echasnovski/mini.nvim",
      },
      opts = {},
    },
  },
  keys = function()
    local obsidian = require("obsidian")

    return {
      {
        "<leader>og",
        obsidian.util.gf_passthrough(),
        desc = "Follow obsidian link",
      },
    }
  end,
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/obsidian/personal",
      },
      {
        name = "kaluza",
        path = "~/obsidian/work",
      },
    },

    templates = {
      folder = "templates",
      date_format = "%Y-%m-%d",
    },

    daily_notes = {
      folder = "6. daily",
      date_format = "%Y-%m-%d",
      default_tags = {},
      template = "templates/daily.md",
    },

    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },

    new_notes_location = "current_dir",
    open_app_foreground = false,
    disable_frontmatter = true,
    ui = {
      enable = false,
    },

    follow_url_func = function(url)
      vim.fn.jobstart({ "open", url }) -- Mac OS
    end,

    note_id_func = function(title)
      local suffix = ""
      if title ~= nil then
        suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      else
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      return tostring(os.time()) .. "-" .. suffix
    end,
  },
}
