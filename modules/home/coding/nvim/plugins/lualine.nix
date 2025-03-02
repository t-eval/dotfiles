{...}: {
  programs.nixvim.plugins.lualine = {
    enable = true;
    autoLoad = true;

    settings = {
      options = {
        icons_enabled = true;
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
