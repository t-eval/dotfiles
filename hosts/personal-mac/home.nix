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

  };
}
