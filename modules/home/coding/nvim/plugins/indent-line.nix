{...}: {
  programs.nixvim.plugins.indent-blankline = {
    enable = false;
    autoLoad = true;

    settings = {
      scope.enabled = false;
      indent = {
        char = "~";
      };
    };
  };
}
