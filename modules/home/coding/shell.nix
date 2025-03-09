{...}: {
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

      syntaxHighlighting.enable = true;
    };

    starship = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        add_newline = false;
        format = "$username$hostname$directory$git_branch$c$shell$character";

        username.show_always = true;
        c = {
          format = "via [$name $version](bold blue)";
        };
      };
    };
  };
}
