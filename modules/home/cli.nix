{ ... }: {

  programs = {

    fastfetch = {
      enable = true;

      settings = {

        logo = {
          type = "iterm";
          width = 60;
          height = 30;
          source =
            "~/Downloads/Murakami_Shiina_Holding_Computer_C_Programming_Language.png";
          padding.right = 2;
        };

        display = {
          "separator" = " ~> ";
          "key" = { "width" = 15; };
        };

        modules = [
          "break"
          "break"
          "break"
          "title"
          "separator"
          "os"
          "terminal"
          "kernel"
          "datetime"
          "shell"
          "separator"
          "disk"
          "memory"
          "cpu"
          {
            "type" = "gpu";
            "format" = "{name}";
          }
          "separator"

          {

            "type" = "command";
            "text" = "$EDITOR --version | head -1";
            "key" = "Editor";

          }
        ];
      };
    };
  };
}
