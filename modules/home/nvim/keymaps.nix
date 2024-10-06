{ ... }: {

  programs.nixvim.keymaps = [
    # Plugins
    {
      action = "<cmd>Oil<cr>";
      mode = "n";
      key = "-";
      options.desc = "Oil mode";
    }
    {
      action = "<cmd>RenderMarkdown toggle<cr>";
      mode = "n";
      key = "<leader>mt";
      options.desc = "Toggle RenderMarkdown";
    }

    # Panes navigation
    {
      action = "<C-w><C-h>";
      mode = "n";
      key = "<C-h>";
      options.desc = "Move focus to left pane";
    }
    {
      action = "<C-w><C-l>";
      mode = "n";
      key = "<C-l>";
      options.desc = "Move focus to right pane";
    }
    {
      action = "<C-w><C-j>";
      mode = "n";
      key = "<C-j>";
      options.desc = "Move focus to bottom pane";
    }
    {
      action = "<C-w><C-k>";
      mode = "n";
      key = "<C-k>";
      options.desc = "Move focus to upper pane";
    }

    # Fugitive
    {
      action = "<cmd>Git<cr>";
      mode = "n";
      key = "<leader>gs";
      options.desc = "Open Git";
    }
    {
      action = "<cmd>Git push<cr>";
      mode = "n";
      key = "<leader>gp";
      options.desc = "Git push";
    }
    {
      action = "<cmd>Git commit<cr>";
      mode = "n";
      key = "<leader>gm";
      options.desc = "Git commit";
    }
    {
      action = "<cmd>Git pull<cr>";
      mode = "n";
      key = "<leader>gP";
      options.desc = "Git pull";
    }
  ];
}
