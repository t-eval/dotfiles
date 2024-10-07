{ ... }: {

  programs.nixvim.plugins = {
    web-devicons.enable = false;

    telescope = {
      enable = true;
      keymaps = {
        "<leader>p" = {
          action = "find_files";
          options.desc = "Telescope find_files";
        };
        "<leader>tp" = {
          action = "git_files";
          options.desc = "Telescope git_files";
        };
      };
    };
  };
}
