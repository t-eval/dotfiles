{pkgs, ...}: {
  stylix.targets.firefox = {
    enable = true;
    firefoxGnomeTheme.enable = true;
    profileNames = ["default"];
  };

  programs.firefox = {
    enable = true;
    package = null;

    profiles = {
      default = {
        name = "void";
        settings = import ./settings.nix;

        bookmarks = {
          force = true;
          settings = [
            {
              name = "Default";
              toolbar = true;
              bookmarks = [
                {
                  name = "Github";
                  url = "https://github.com";
                }
                {
                  name = "Sheets";
                  url = "https://docs.google.com/spreadsheets";
                }
              ];
            }
            {
              name = "Entertainment";
              toolbar = true;
              bookmarks = [
                {
                  name = "Youtube";
                  url = "https://www.youtube.com";
                }
                {
                  name = "PsnProfile";
                  url = "https://psnprofiles.com/t_eval";
                }
              ];
            }
          ];
        };

        extensions = {
          packages = with pkgs.nur.repos.rycee.firefox-addons; [
            ublock-origin
            proton-pass
          ];
        };

        search = {
          force = true;
          default = "google";
          order = ["google"];

          engines = {
            "youTube" = {
              icon = "https://youtube.com/favicon.ico";
              updateInterval = 24 * 60 * 60 * 1000;
              definedAliases = ["@yt"];
              urls = [
                {
                  template = "https://www.youtube.com/results";
                  params = [
                    {
                      name = "search_query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
            };

            "bing".metaData.hidden = true;
            "ebay".metaData.hidden = true;
            "wikipedia".metaData.hidden = true;
            "history".metaData.hidden = true;
            "google".metaData.alias = "@g";
          };
        };
      };
    };
  };
}
