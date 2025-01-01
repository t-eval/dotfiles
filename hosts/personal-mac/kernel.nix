{ ... }: {

  nix-homebrew = {
    enable = true;
    user = "void";
    enableRosetta = true;
    autoMigrate = true;
  };

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
    };
    casks = [ "ghostty" ];
  };

  macos = {
    dock = {
      apps = [ "/Applications/Safari.app" "/Applications/Ghostty.app" ];

      hide = true;
    };
  };
}
