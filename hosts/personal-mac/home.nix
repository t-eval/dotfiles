{ ... }: {

  imports = [ ./software.nix ];

  home = {
    obsidian = {
      enable = false;
      workspaces = [{
        name = "personal";
        path = "~/obsidian/personal";
      }];
    };

    git = {
      username = "tommasobruno";
      email = "bruno.tommaso@protonmail.com";
    };
  };
}
