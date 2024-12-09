{ pkgs, ... }: {

  macos = {
    dock = {
      apps = [
        "${pkgs.wezterm}/Applications/Wezterm.app"
        # "${pkgs.obsidian}/Applications/Obsidian.app"
        "/Applications/Safari.app"
        "/Applications/reMarkable.app"
      ];

      hide = true;
    };
  };
}
