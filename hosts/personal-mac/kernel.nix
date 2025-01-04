{...}: {
  macos = {
    dock = {
      apps = ["/Applications/Ghostty.app"];
      hide = true;
    };

    homebrew = {casks = ["ghostty"];};
  };
}
