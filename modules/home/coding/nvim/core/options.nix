{...}: {
  programs.nixvim = {
    globals = {
      mapleader = ",";
    };

    opts = {
      inccommand = "split";
      termguicolors = true;
      guicursor = "";

      smartcase = true;
      ignorecase = true;
      hlsearch = false;

      number = true;
      relativenumber = true;
      colorcolumn = "100";

      splitbelow = true;
      splitright = true;

      signcolumn = "yes";

      wrap = true;
      linebreak = true;

      tabstop = 2;
      expandtab = true;
      shiftwidth = 2;
      smartindent = true;

      more = false;
      foldmethod = "manual";

      completeopt = ["menu" "menuone" "noselect"];
    };
  };
}
