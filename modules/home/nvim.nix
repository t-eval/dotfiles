{ pkgs, ... }: {

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  # Language servers, formatters
  home.packages = with pkgs; [

    # Lua
    lua-language-server
    stylua
    lua

    # Haskell
    haskellPackages.haskell-language-server
    haskellPackages.hindent
    haskellPackages.cabal-install
    ghc

    # Nix
    nil
    nixfmt-classic

    # Zig
    zig
    zls

  ];

  xdg.configFile."nvim" = {
    recursive = true;
    source = ./config/nvim;
  };
}
