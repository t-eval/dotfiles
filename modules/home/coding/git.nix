{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.coding.git;
in {
  options = {
    coding.git = with types; {
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

      aliases = {
        sw = "switch";
        re = "rebase";
      };

      extraConfig = {
        push.autoSetupRemote = true;
        init.defaultBranch = "main";
      };
    };
  };
}
