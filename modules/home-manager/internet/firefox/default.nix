{pkgs, ...}: {
  programs.firefox = {
    enable = true;
    package = null;

    profiles = {
      default = {
        name = "void";
        settings = import ./settings.nix;

        bookmarks = [
          {
            name = "Default";
            toolbar = true;
            bookmarks = [
              {
                name = "Github";
                url = "https://github.com/novadev-org";
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
            ];
          }
        ];

        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          proton-pass
        ];

        search = {
          force = true;
          default = "Google";
          order = ["Google"];

          engines = {
            "YouTube" = {
              iconUpdateURL = "https://youtube.com/favicon.ico";
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

            "Bing".metaData.hidden = true;
            "eBay".metaData.hidden = true;
            "Wikipedia (en)".metaData.hidden = true;
            "History".metaData.hidden = true;
            "Google".metaData.alias = "@g";
          };
        };
      };
    };
  };
}
