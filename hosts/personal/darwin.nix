{pkgs, ...}: {
  darwin = {
    dock = {
      persistent-apps = [
        "/Applications/Ghostty.app"
        "${pkgs.obsidian}/Applications/Obsidian.app"
      ];
    };

    base.useTouchIdForSudo = true;

    homebrew.casks = ["ghostty"];
  };
}
