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

    initExtra = ''
      # Prompt
      autoload -Uz vsc_info
      premcmd() { vcs_info }

      zstyle ':vcs_info:git:*' formats '(%b)'

      RPROMP=""
      setopt PROMPT_SUBST

      if [ -n "$IN_NIX_SHELL" ]; then
        PROMPT="[%F{red}%n%f@%F{red}%1~%f]%F{yellow}"\$\{vcs_info_msg_0_}"%f%F{green}(nix-shell)%f# "
      else
        PROMPT="[%F{red}%n%f@%F{red}%1~%f]%F{yellow}"\$\{vcs_info_msg_0_}"%f# "
      fi
    '';
  };
}
