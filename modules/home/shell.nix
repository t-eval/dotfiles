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

      autoload -Uz vcs_info
      zstyle ':vcs_info:*' enable git svn

      zstyle ':vcs_info:git*' formats "(%b)"
      precmd() {
        vcs_info
      }

      RPROMP=""
      setopt PROMPT_SUBST

      if [ -n "$IN_NIX_SHELL" ]; then
        PROMPT="[%F{red}%n%f@%F{red}%1~%f]%F{yellow}''${vcs_info_msg_0_}%f%F{green}(nix-shell)%f# "
      else
        PROMPT="[%F{red}%n%f@%F{red}%1~%f]%F{yellow}''${vcs_info_msg_0_}%f# "
      fi
    '';
  };
}
