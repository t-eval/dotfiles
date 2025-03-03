{...}: {
  programs.nixvim.plugins.lualine = {
    enable = true;
    autoLoad = true;

    settings = {
      options = {
        icons_enabled = false;
        theme = "auto";
        component_separators = {
          left = "|";
          right = "|";
        };
        section_separators = {
          left = " ";
          right = " ";
        };
      };
    };
  };
}
