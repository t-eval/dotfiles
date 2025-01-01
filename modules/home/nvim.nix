{ pkgs, ... }: {

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  # Language servers, formatters
  home.packages = with pkgs; [
    # Tools
    ripgrep

    # Lua
    lua-language-server
    stylua
    lua
    luajitPackages.luarocks

    # Nix
    nil
    nixfmt-classic
  ];

  xdg.configFile."nvim" = {
    recursive = true;
    source = ./config/nvim;
  };
}
