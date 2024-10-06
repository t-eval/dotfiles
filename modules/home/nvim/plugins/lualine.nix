{ ... }: {

  programs.nixvim.plugins.lualine = {
    enable = true;

    settings.options = {
      icons_enabled = false;

      component_separators = {
        left = "|";
        right = "|";
      };
      section_separators = {
        left = "";
        right = "";
      };
    };
  };
}
