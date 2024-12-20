{ pkgs, ... }: {

  macos = {
    dock = {
      apps = [
        "${pkgs.wezterm}/Applications/Wezterm.app"
        "/Applications/Safari.app"
      ];

      hide = true;
    };
  };
}
