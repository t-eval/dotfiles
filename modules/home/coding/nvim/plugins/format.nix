{...}: {
  programs.nixvim.plugins.conform-nvim = {
    enable = true;
    autoLoad = true;

    settings = {
      formatters_by_ft = {
        nix = ["alejandra"];
        c = ["clang-format"];
      };

      format_on_save = {
        timeout_ms = 500;
        lsp_format = "fallback";
      };
    };
  };
}
