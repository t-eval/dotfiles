{...}: {
  programs.zsh = {
    enable = true;

    shellAliases = {
      # Nix
      nixs = "/run/current-system/sw/bin/darwin-rebuild switch --flake ~/coding/ada#personal";
      nd = "nix develop -c $SHELL";

      # Rest
      ls = "ls -al --color=auto";
    };
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
