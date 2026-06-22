-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 162 -- 120
config.initial_rows = 48 -- 28

-- or, changing the font size and color scheme.
config.font_size = 13
config.color_scheme = 'AdventureTime'
config.font = wezterm.font('FiraCode Nerd Font Mono', { weight = 'DemiBold' })

-- put the terminal in the center of the screen
wezterm.on("gui-startup", function(cmd)
  local screen = wezterm.gui.screens().active
  local ratio = 0.6
  local width, height = screen.width * ratio, screen.height * ratio
  local tab, pane, window = wezterm.mux.spawn_window {
    position = {
      x = (screen.width - width) / 2,
      y = (screen.height - height) / 2,
      origin = 'ActiveScreen' }
  }
  window:gui_window():set_inner_size(width, height)
end)

-- Finally, return the configuration to wezterm:
return config
