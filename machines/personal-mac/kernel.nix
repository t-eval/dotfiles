{...}: {
  macos = {
    dock = {
      persistent-apps = ["/Applications/Ghostty.app"];
    };

    homebrew.casks = ["ghostty"];
  };
}
