{pkgs, ...}: {
  darwin = {
    dock = {
      persistent-apps = [
        "/Applications/Ghostty.app"
        "${pkgs.obsidian}/Applications/Obsidian.app"
      ];
    };

    homebrew.casks = ["ghostty"];
  };
}
