-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'Batman'
-- config.color_scheme = 'Later This Evening (Gogh)'


-- config.font = wezterm.font 'Fira Code'
config.font = wezterm.font 'Hack Nerd Font'

config.hide_tab_bar_if_only_one_tab = true

config.window_background_opacity = 0.5

-- config.text_background_opacity = 0.5

config.window_decorations = "NONE"


config.skip_close_confirmation_for_processes_named = {
  'bash',
  'sh',
  'zsh',
  'fish',
  'tmux',
  'zellij',
  'nu',
  'cmd.exe',
  'pwsh.exe',
  'powershell.exe',
}

-- and finally, return the configuration to wezterm
return config
