{pkgs, ...}: {
  stylix = {
    enable = true;
    autoEnable = false;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/black-metal-gorgoroth.yaml";

    fonts.sizes = {
      terminal = 13;
      applications = 13;
    };
  };

  coding = {
    terminal.ghostty = true;
    nvim.enable = true;
    git = {
      username = "tommasobruno";
      email = "bruno.tommaso@protonmail.com";
    };
  };

  apps.obsidian.enable = true;
}
