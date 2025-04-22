{...}: {
  stylix.targets.starship.enable = true;
  programs = {
    zsh = {
      enable = true;

      shellAliases = {
        # Nix
        nixs = "/run/current-system/sw/bin/darwin-rebuild switch --flake ~/git/dotfiles#personal";
        nd = "nix develop -c $SHELL";
        nb = "nix build";

        # Rest
        ls = "ls -al --color=auto";
      };

      #syntaxHighlighting.enable = true;
    };

    starship = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        add_newline = false;
        format = "\\[$hostname@$directory\\]$git_branch$character";

        git_branch.format = "[\\($branch\\)](bold base12)";
        directory.format = "[$path](bold base14)";
        hostname = {
          ssh_only = false;
          format = "[$hostname](bold base14)";
        };
        character.format = "# ";
      };
    };
  };
}
