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
local best_font = "Aporetic Sans Mono"
config.font = wezterm.font(best_font, {
  stretch = "Expanded",
})
config.font_size = 24

-- Config for padding
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.enable_tab_bar = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = false

-- Make transparent tab bar
config.colors = {
  tab_bar = {
    background = "rgba(0, 0, 0, 0.0)",
    inactive_tab = {
      bg_color = "rgba(0, 0, 0, 0.2)",
      fg_color = "#808080",
    },
    active_tab = {
      bg_color = "rgba(0, 0, 0, 0.4)",
      fg_color = "#FFFFFF",
    },
    new_tab = {
      bg_color = "rgba(0, 0, 0, 0.2)",
      fg_color = "#808080",
    },
  }
}

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

-- Setup launcher with ALT + L
config.keys = {
  {
    key = "l",
    mods = "ALT",
    action = wezterm.action.ShowLauncher,
  },
}

-- On press key "X" [1, 8] do action wezterm.action.ActivateTab(X)
for i = 1, 8 do
  table.insert(config.keys, {
    key = tostring(i),
    mods = "ALT",
    action = wezterm.action.ActivateTab(i - 1),
  })
end

return config
