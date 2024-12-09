{ ... }: {

  programs.nixvim.colorschemes = {

    gruvbox = {
      enable = false;
      settings = {
        terminal_colors = true;
        transparent_mode = true;
      };
    };

    rose-pine = {
      enable = false;
      settings = {
        extend_background_behind_borders = true;
        enable = { terminal = false; };
        styles = { transparency = true; };
      };
    };

    tokyonight = {
      enable = true;
      settings = {
        terminal_colors = true;
        style = "night";
      };
    };
  };
}
