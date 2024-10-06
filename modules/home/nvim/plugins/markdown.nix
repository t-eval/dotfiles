{ ... }: {

  programs.nixvim.plugins.render-markdown = {
    enable = true;

    settings = {
      enabled = true;

      pipe_table = {
        enabled = true;
        preset = "none";
        style = "full";
        cell = "padded";
        min_width = 0;
        border = [ "┌" "┬" "┐" "├" "┼" "┤" "└" "┴" "┘" "│" "─" ];
        alignment_indicator = "━";
        head = "RenderMarkdownTableHead";
        row = "RenderMarkdownTableRow";
        filler = "RenderMarkdownTableFill";
      };

      checkbox = {
        enabled = true;
        position = "inline";
        unchecked = {
          icon = "󰄱 ";
          highlight = "RenderMarkdownUnchecked";
        };
        checked = {
          icon = "󰱒 ";
          highlight = "RenderMarkdownChecked";
        };
        custom = {
          todo = {
            raw = "[-]";
            rendered = "󰥔 ";
            highlight = "RenderMarkdownTodo";
          };
        };
      };

      heading = {
        enabled = true;
        sign = true;
        position = "overlay";
        icons = [ "󰲡 " "󰲣 " "󰲥 " "󰲧 " "󰲩 " "󰲫 " ];
        signs = [ "󰫎 " ];
        width = "full";
        left_margin = 0;
        left_pad = 0;
        right_pad = 0;
        min_width = 0;
        border = false;
        border_virtual = false;
        border_prefix = false;
        above = "▄";
        below = "▀";
        backgrounds = [
          "RenderMarkdownH1Bg"
          "RenderMarkdownH2Bg"
          "RenderMarkdownH3Bg"
          "RenderMarkdownH4Bg"
          "RenderMarkdownH5Bg"
          "RenderMarkdownH6Bg"
        ];
        foregrounds = [
          "RenderMarkdownH1"
          "RenderMarkdownH2"
          "RenderMarkdownH3"
          "RenderMarkdownH4"
          "RenderMarkdownH5"
          "RenderMarkdownH6"
        ];
      };
      render_modes = true;
      signs = { enabled = false; };
    };
  };
}
