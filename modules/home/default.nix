{...}: {
  programs.home-manager.enable = true;
  xdg.enable = true;

  home = {
    sessionPath = ["/opt/homebrew/bin"];
    stateVersion = "25.05";
    sessionVariables = {
      EDITOR = "nvim";
      LANG = "ko_KR.UTF-8";
    };
  };

  imports = [./coding ./internet ./apps];
}
