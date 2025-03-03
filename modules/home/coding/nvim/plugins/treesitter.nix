{pkgs, ...}: {
  programs.nixvim.plugins.treesitter = {
    enable = true;
    autoLoad = true;
    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      nix
      c
    ];

    settings = {
      highlight = {
        enable = true;
        additional_vim_regex_highlighting = false;
      };
    };
  };
}
