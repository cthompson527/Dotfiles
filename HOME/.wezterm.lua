local wezterm = require("wezterm")
local act = wezterm.action

local config = {}

config.font = wezterm.font("JetBrains Mono")
config.color_scheme = "OneDark (base16)"
config.font_size = 14
config.window_background_opacity = 1
config.use_fancy_tab_bar = false

config.colors = {
	cursor_bg = "#ff8c00",
	cursor_fg = "black",
}

config.keys = {
	{
		key = ",",
		mods = "CMD",
		action = act.SpawnCommandInNewTab({
			cwd = os.getenv("WEZTERM_CONFIG_DIR"),
			set_environment_variables = {
				TERM = "screen-256color",
			},
			args = {
				"/usr/local/bin/nvim",
				os.getenv("WEZTERM_CONFIG_FILE"),
			},
		}),
	},
	{
		key = "LeftArrow",
		mods = "OPT",
		action = act.SendKey({
			key = "b",
			mods = "ALT",
		}),
	},
	{
		key = "RightArrow",
		mods = "OPT",
		action = act.SendKey({
			key = "f",
			mods = "ALT",
		}),
	},
	{
		key = "Enter",
		mods = "ALT",
		action = wezterm.action.DisableDefaultAssignment,
	},
}

return config
