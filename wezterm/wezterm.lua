local wezterm = require("wezterm")
local act = wezterm.action

local config = {}
if wezterm.config_builder then config = wezterm.config_builder() end

config.color_scheme = "Tokyo Night"
config.font = wezterm.font_with_fallback({
  { family = "CaskaydiaCove Nerd Font",  scale = 1.3 },
  { family = "FantasqueSansM Nerd Font", scale = 1.3 },
})
config.window_background_opacity = 0.9
config.window_decorations = "RESIZE"
config.window_close_confirmation = "AlwaysPrompt"
config.scrollback_lines = 3000
config.default_workspace = "main"
config.font_size = 15
-- Default Load Size
config.initial_rows = 45
config.initial_cols = 150

-- Dim inactive panes
config.inactive_pane_hsb = {
  saturation = 0.24,
  brightness = 0.5
}
-- Tab Bar UI
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
-- Cursor
config.default_cursor_style = 'SteadyBlock'
-- Key Bindings
config.leader = { key = "q", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
  { key = "phys:Space", mods = "LEADER",       action = act.ActivateCommandPalette },
  { key = "c",          mods = "LEADER",      action = act.ActivateCopyMode },
  { key = "s",          mods = "LEADER",       action = act.SplitVertical { domain = "CurrentPaneDomain" } },
  { key = "v",          mods = "LEADER",       action = act.SplitHorizontal { domain = "CurrentPaneDomain" } },
  { key = "o",          mods = "LEADER",       action = act.RotatePanes "Clockwise" },
  { key = "n",          mods = "LEADER",       action = act.ShowTabNavigator },
  { key = "{",          mods = "LEADER|SHIFT", action = act.MoveTabRelative(-1) },
  { key = "}",          mods = "LEADER|SHIFT", action = act.MoveTabRelative(1) },
  { key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
  { key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
  { key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
  { key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
  {
    key = "e",
    mods = "LEADER",
    action = act.PromptInputLine {
      description = wezterm.format {
        { Attribute = { Intensity = "Bold" } },
        { Foreground = { AnsiColor = "Fuchsia" } },
        { Text = "Renaming Tab Title...:" },
      },
      action = wezterm.action_callback(function(window, pane, line)
        if line then
          window:active_tab():set_title(line)
        end
      end)
    }
  },
}
return config
