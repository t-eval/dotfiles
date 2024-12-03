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
      enable = true;
      settings = {
        extend_background_behind_borders = true;
        enable = { terminal = false; };
        styles = { transparency = true; };
      };
    };
  };
}
