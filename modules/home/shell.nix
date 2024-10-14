{ ... }: {

  programs.zsh = {
    enable = true;

    shellAliases = {
      # Nix
      nixs =
        "/run/current-system/sw/bin/darwin-rebuild switch --flake ~/.system/.#personal";
      nd = "nix develop -c $SHELL";

      # Rest
      ls = "ls -al --color=auto";
    };
    initExtraFirst = ''
      RPROMP=""
      setopt PROMPT_SUBST

      PROMPT="[%F{red}%n%f@%F{red}%1~%f]# " 
    '';
  };
}
