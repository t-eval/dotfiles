{ ... }: {

  programs.nixvim.plugins.conform-nvim = {
    enable = true;
    settings = {
      format_on_save = {
        timeoutMs = 500;
        lspFallback = true;
      };

      formatters_by_ft = {
        # Always have 
        nix = [ "nixfmt" ];

        # Use with nix develop
        zig = [ "zigfmt" ];
        rust = [ "rustfmt" ];
        c = [ "clang-format" ];
        go = [ "gofmt" ];
        json = [ "fixjson" ];
      };
    };
  };
}
