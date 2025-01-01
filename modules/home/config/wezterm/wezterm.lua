local wezterm = require("wezterm")

local config = {}
local mux = wezterm.mux

wezterm.on("gui-startup", function()
  local _, _, window = mux.spawn_window({})
  window:gui_window():maximize()
end)

if wezterm.config_builder() then
  config = wezterm.config_builder()
end

config.colors = {
  background = "#111111",
}

config.keys = {
  {
    key = "k",
    mods = "CMD",
    action = wezterm.action.ClearScrollback("ScrollbackAndViewport"),
  },
}

config.window_decorations = "RESIZE"
config.window_background_opacity = 1

config.font = wezterm.font("Berkeley Mono")
config.font_size = 13
config.front_end = "WebGpu"
config.use_fancy_tab_bar = false
config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = true

config.enable_scroll_bar = false
config.tab_bar_at_bottom = true
config.freetype_load_target = "HorizontalLcd"

return config
