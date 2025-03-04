{...}: {
  programs.nixvim = {
    globals = {
      mapleader = ",";
    };

    opts = {
      guicursor = "";
      termguicolors = true;

      smartcase = true;
      ignorecase = true;
      hlsearch = false;

      number = true;
      relativenumber = true;
      colorcolumn = "100";
      signcolumn = "yes";

      splitbelow = true;
      splitright = true;

      wrap = true;
      linebreak = true;
      scrolloff = 10;

      tabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      smartindent = true;

      clipboard = "unnamedplus";
      completeopt = ["menu" "menuone" "noselect"];
    };
  };
}
