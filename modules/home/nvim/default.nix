{ pkgs, ... }: {

  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    extraPackages = with pkgs; [ nixfmt-classic ripgrep ];

  };

  imports = [ ./globals.nix ./options.nix ./keymaps.nix ./plugins ];
}
