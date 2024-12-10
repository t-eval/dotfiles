{ ... }: {

  programs.git = { enable = true; };

  xdg.configFile."git/config".source = ./config/git/config;
}
