{...}: {
  programs.zsh = {
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

    initExtraFirst = ''
      RPROMP=""
      setopt PROMPT_SUBST

      if [ -n "$IN_NIX_SHELL" ]; then
        PROMPT="[%F{red}%n%f@%F{red}%1~%f]%F{green}(nix-shell)%f# "
      else
        PROMPT="[%F{red}%n%f@%F{red}%1~%f]# "
      fi
    '';
  };
}
