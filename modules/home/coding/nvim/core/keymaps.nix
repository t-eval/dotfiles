{...}: {
  programs.nixvim.keymaps = [
    {
      action = "<cmd>Oil<cr>";
      key = "-";
      mode = "n";
      options.desc = "Open parent directory";
    }

    # Fugitive
    {
      action = "<cmd>Git<cr>";
      key = "<leader>gs";
      options.desc = "Open Git";
    }
    {
      action = "<cmd>Git commit<cr>";
      key = "<leader>gm";
      options.desc = "Git commit";
    }
    {
      action = "<cmd>Git push<cr>";
      key = "<leader>gp";
      options.desc = "Git push";
    }
    {
      action = "<cmd>Git pull<cr>";
      key = "<leader>gP";
      options.desc = "Git pull";
    }
  ];
}
