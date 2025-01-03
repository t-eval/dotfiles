{...}: {
  # Allow home-manager to manage itself
  programs.home-manager.enable = true;
  xdg.enable = true;

  # Basic home-manager settings
  home = {
    sessionPath = ["/opt/homebrew/bin"];
    stateVersion = "24.11";
    sessionVariables = {
      EDITOR = "nvim";
      LANG = "ko_KR.UTF-8";
    };
  };

  imports = [./git.nix ./shell.nix ./nvim.nix ./terminal.nix];
}
