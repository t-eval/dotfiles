{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.home.git;
in {
  options = {
    home.git = with types; {
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
