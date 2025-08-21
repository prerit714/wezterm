local wezterm = require("wezterm")
local mux = wezterm.mux

-- Open wezterm in full screen mode by default
wezterm.on("gui-startup", function()
  local _, _, window = mux.spawn_window({})
  window:gui_window():maximize()
end)

local config = {}
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Font config
config.color_scheme = "Vacuous 2 (terminal.sexy)"
local best_font = "IosevkaTermSlab Nerd Font Mono"
config.font = wezterm.font(best_font, {
  stretch = "Expanded",
  weight = "Medium",
})
config.font_size = 24

-- Config for padding
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- Hide native tabs since I use tmux
config.enable_tab_bar = false

-- Config I like for my mac
config.window_decorations = "RESIZE|MACOS_FORCE_SQUARE_CORNERS"
config.adjust_window_size_when_changing_font_size = false


-- Show wallpaper in the background
config.window_background_opacity = 1

local config_dir = wezterm.config_dir or wezterm.home_dir .. '/.config/wezterm'

config.background = {
  {
    source = {
      File = config_dir .. '/female-v.jpg',
    },
    hsb = {
      hue = 1.0,
      saturation = 1.0,
      brightness = 0.1, -- Adjust this value to make text readable
    },
    width = "100%",
    height = "100%",
  },
}

return config
