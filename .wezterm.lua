-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end
--
-- config.font = wezterm.font("Fira Code")
-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'AdventureTime'
print("set cwd")
config.default_cwd = "~/code"
config.initial_rows = 100

-- Spawn a fish shell in login mode
config.default_prog = { "stmux_sh" }
-- and finally, return the configuration to wezterm
return config
