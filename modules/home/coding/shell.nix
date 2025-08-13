{...}: {
  programs = {
    zsh = {
      enable = true;

      shellAliases = {
        # Nix
        nixs = "sudo /run/current-system/sw/bin/darwin-rebuild switch --flake ~/git/dotfiles#personal";
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
        format = "\\[$hostname@$directory$nix_shell\\]$git_branch$character";

        git_branch.format = "[\\($branch\\)](bold red)";
        directory = {
          truncation_length = 1;
          format = "[$path](bold yellow)";
        };
        hostname = {
          ssh_only = false;
          format = "[$hostname](bold yellow)";
        };
        nix_shell.format = "[*$name](bold blue)";
        character.format = "# ";
      };
    };
  };
}
