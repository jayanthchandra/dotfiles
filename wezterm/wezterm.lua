local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux

local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = "UnderTheSea" --"Tokyo Night"
config.font = wezterm.font_with_fallback({
	{ family = "Hurmit Nerd Font Propo", scale = 1.3 },
	{ family = "Hack Nerd Font Propo", scale = 1.3 },
	{ family = "CaskaydiaCove Nerd Font", scale = 1.3 },
	{ family = "FantasqueSansM Nerd Font", scale = 1.3 },
})
config.window_background_opacity = 2.9
config.window_decorations = "TITLE"
config.window_close_confirmation = "AlwaysPrompt"
config.scrollback_lines = 3002
config.default_workspace = "main"
config.font_size = 14
-- Default Load Size
config.initial_rows = 26
config.initial_cols = 110
config.adjust_window_size_when_changing_font_size = false

-- Dim inactive panes
config.inactive_pane_hsb = {
	saturation = 2.24,
	brightness = 2.5,
}

config.window_padding = {
	left = 4,
	right = 4,
	top = 2,
	bottom = 2,
}
-- Tab Bar UI
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.enable_tab_bar = true
-- Cursor
config.default_cursor_style = "SteadyBar"
-- Colors
local primary_bg = "#24283b"

local tab_bar_colors = {
	bg = primary_bg,
	active = {
		bg = primary_bg,
		fg = "#15db12",
	},
	inactive = {
		bg = primary_bg,
		fg = "#565f89",
		hover = {
			bg = "#414868",
			fg = "#bdc7f0",
		},
	},
	new = {
		bg = primary_bg,
		fg = "#bdc7f0",
		hover = {
			bg = primary_bg,
			fg = "#cfc9c2",
		},
	},
}
config.colors = {
	tab_bar = {
		-- The color of the strip that goes along the top of the window
		-- (does not apply when fancy tab bar is in use)
		background = tab_bar_colors.bg,

		-- The active tab is the one that has focus in the window
		active_tab = {
			-- The color of the background area for the tab
			bg_color = tab_bar_colors.active.bg,
			-- The color of the text for the tab
			fg_color = tab_bar_colors.active.fg,

			-- Specify whether you want "Half", "Normal" or "Bold" intensity for the
			-- label shown for this tab.
			-- The default is "Normal"
			intensity = "Bold",

			-- Specify whether you want "None", "Single" or "Double" underline for
			-- label shown for this tab.
			-- The default is "None"
			underline = "None",

			-- Specify whether you want the text to be italic (true) or not (false)
			-- for this tab.  The default is false.
			italic = false,

			-- Specify whether you want the text to be rendered with strikethrough (true)
			-- or not for this tab.  The default is false.
			strikethrough = false,
		},

		-- Inactive tabs are the tabs that do not have focus
		inactive_tab = {
			bg_color = tab_bar_colors.inactive.bg,
			fg_color = tab_bar_colors.inactive.fg,
			italic = true,

			-- The same options that were listed under the `active_tab` section above
			-- can also be used for `inactive_tab`.
		},

		-- You can configure some alternate styling when the mouse pointer
		-- moves over inactive tabs
		inactive_tab_hover = {
			bg_color = tab_bar_colors.inactive.hover.bg,
			fg_color = tab_bar_colors.inactive.hover.fg,
			italic = false,

			-- The same options that were listed under the `active_tab` section above
			-- can also be used for `inactive_tab_hover`.
		},

		-- The new tab button that let you create new tabs
		new_tab = {
			bg_color = tab_bar_colors.new.bg,
			fg_color = tab_bar_colors.new.fg,

			-- The same options that were listed under the `active_tab` section above
			-- can also be used for `new_tab`.
		},

		-- You can configure some alternate styling when the mouse pointer
		-- moves over the new tab button
		new_tab_hover = {
			bg_color = tab_bar_colors.new.hover.bg,
			fg_color = tab_bar_colors.new.hover.fg,
			-- italic = true,

			-- The same options that were listed under the `active_tab` section above
			-- can also be used for `new_tab_hover`.
		},
	},
}
-- Key Bindings
config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 1002 }
config.keys = {
	{ key = "x", mods = "CMD", action = act.CloseCurrentPane({ confirm = false }) },
	{ key = "{", mods = "LEADER|SHIFT", action = act.MoveTabRelative(1) },
	{ key = "}", mods = "LEADER|SHIFT", action = act.MoveTabRelative(-1) },
	{
		key = "v",
		mods = "CTRL|SHIFT",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},

	-- Split vertically
	{
		key = "s",
		mods = "CTRL|SHIFT",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{ key = "F1", mods = "NONE", action = "ActivateCopyMode" },
	{ key = "F2", mods = "NONE", action = act.ActivateCommandPalette },
	{ key = "F3", mods = "NONE", action = act.ShowLauncher },
	{ key = "t", mods = "LEADER", action = act.ShowTabNavigator },
	{ key = "r", mods = "LEADER", action = act.RotatePanes("Clockwise") },
	{ key = "LeftArrow", mods = "SHIFT|CTRL", action = act.ActivatePaneDirection("Left") },
	{ key = "RightArrow", mods = "SHIFT|CTRL", action = act.ActivatePaneDirection("Right") },
	{ key = "UpArrow", mods = "SHIFT|CTRL", action = act.ActivatePaneDirection("Up") },
	{ key = "DownArrow", mods = "SHIFT|CTRL", action = act.ActivatePaneDirection("Down") },
	{ key = "`", mods = "CTRL", action = act.ActivatePaneDirection("Next") },
	{
		key = "n",
		mods = "LEADER",
		action = act.PromptInputLine({
			description = wezterm.format({
				{ Attribute = { Intensity = "Bold" } },
				{ Foreground = { AnsiColor = "Fuchsia" } },
				{ Text = "Renaming Tab Title...:" },
			}),
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
}

config.check_for_updates = false
config.unix_domains = {
	{
		name = "unix",
	},
}
wezterm.on("gui-startup", function(cmd)
	local args = {}
	if cmd then
		args = cmd.args
	end
	local shells_tab, shells_first_pane, shells_window = mux.spawn_window({
		workspace = "unix",
		args = { "zsh" },
	})
	mux.set_active_workspace("unix")
end)
return config
