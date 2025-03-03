{...}: {
  programs.nixvim.plugins.lint = {
    enable = true;
    autoLoad = true;

    lintersByFt = {
      c = ["clangtidy"];
      nix = ["nix"];
    };
  };
}
