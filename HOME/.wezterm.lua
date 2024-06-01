local wezterm = require 'wezterm'
local act = wezterm.action

local config = {}

config.font = wezterm.font 'JetBrains Mono'
config.color_scheme = 'OneDark (base16)'

config.colors = {
  cursor_bg = '#ff8c00',
  cursor_fg = 'black',
}

config.keys = {
  {
    key = 'LeftArrow',
    mods = 'OPT',
    action = act.SendKey {
      key = 'b',
      mods = 'ALT',
    },
  },
  {
    key = 'RightArrow',
    mods = 'OPT',
    action = act.SendKey {
      key = 'f',
      mods = 'ALT',
    },
  },
  {
    key = 'Enter',
    mods = 'ALT',
    action = act.DisableDefaultAssignment,
  },
}

return config

