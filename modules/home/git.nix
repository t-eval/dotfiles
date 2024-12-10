{ ... }: {

  programs.git = { enable = true; };

  xdg.configFile."git" = {
    source = ./config/git;
    recursive = true;
  };
}
