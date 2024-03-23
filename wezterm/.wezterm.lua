local wezterm = require 'wezterm'

local config = wezterm.config_builder()

-- Appearance
config.color_scheme = 'Tokyo Night'
config.font_size = 13
config.window_decorations = "NONE"


-- Key bindings
config.keys = {
  -- This will create a new split and run your default program inside it
  {
    key = '%',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  -- This will create a new split and run your default program inside it
  {
    key = '"',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
}

return config
