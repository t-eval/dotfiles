{...}: {
  programs = {
    starship = {
      enable = true;
      enableZshIntegration = true;
    };

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
  };
}
