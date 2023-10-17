-- TODO:
--	TMUX vs WEZTERM mux?
--
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
config.default_cwd = "/home/jim/code" -- must use absolute path
config.initial_rows = 100

 ----------------------------------------------------------------------------
-- For TMUX:   CHOOSE A or B (B is default)
 ----------------------------------------------------------------------------
-- A
-- jr: bin/stmux_sh is shell script to start tmux and create several windows
-- config.default_prog = { "stmux_sh" }
--
 ----------------------------------------------------------------------------
-- B 
-- manually, after .werzterm.lua finishes, RUN tmux to use tmux.conf
--
-- and finally, return the configuration to wezterm
 ----------------------------------------------------------------------------
--
--
--      EXPERIMENT
---------------------------------------
local mux = wezterm.mux

wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

---------------------------------------
return config
