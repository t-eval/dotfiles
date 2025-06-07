{...}: {
  programs.nixvim.plugins.indent-blankline = {
    enable = true;
    autoLoad = true;

    settings = {
      scope.enabled = false;
      indent = {
        highlight = ["Whitespace"];
      };
    };
  };
}
