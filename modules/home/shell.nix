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

      function git_branch() {
        git rev-parse --abbrev-ref HEAD 2> /dev/null
      }

      function git_branch_with_parens() {
        local branch=$(git_branch)
        if [ -n "$branch" ]; then
          echo "($branch)"
        fi
      }

      RPROMP=""
      setopt PROMPT_SUBST

      if [ -n "$IN_NIX_SHELL" ]; then
        PROMPT="[%F{red}%n%f@%F{red}%1~%f]%F{yellow}$(git_branch_with_parens)%f%F{green}(nix-shell)%f# "
      else
        PROMPT="[%F{red}%n%f@%F{red}%1~%f]%F{yellow}$(git_branch_with_parens)%f# "
      fi
    '';
  };
}
