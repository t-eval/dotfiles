{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.dev-env.git;
in {
  options = {
    dev-env.git = with types; {
      username = mkOption {
        type = str;
        description = "Which git username";
      };

      email = mkOption {
        type = str;
        description = "Which git email";
      };
    };
  };

  config = {
    programs.git = {
      enable = true;

      userEmail = cfg.email;
      userName = cfg.username;

      extraConfig = {
        pull.rebase = true;
        push.autoSetupRemote = true;
        init.defaultBranch = "main";
      };
    };
  };
}
