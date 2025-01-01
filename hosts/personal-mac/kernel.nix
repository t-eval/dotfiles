{ ... }: {

  macos = {
    dock = {
      apps = [ "/Applications/Safari.app" "/Applications/Ghostty.app" ];
      hide = true;
    };

    homebrew = { casks = [ "ghostty" ]; };
  };
}
