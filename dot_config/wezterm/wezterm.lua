-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'Batman'
-- config.color_scheme = 'Later This Evening (Gogh)'

-- DIsable all bindings for debugging
config.disable_default_key_bindings = false


-- config.font = wezterm.font 'Fira Code'
config.font = wezterm.font 'Hack Nerd Font'

config.hide_tab_bar_if_only_one_tab = true


if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  config.default_domain = 'WSL:Ubuntu'
end



config.command_palette_font_size = 12.0
config.command_palette_bg_color = "#1f1f1f"

config.command_palette_rows = 10
config.window_decorations = "RESIZE"


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


config.keys = {
  {
    key = '9',
    mods = 'ALT',
    action = wezterm.action.ShowLauncherArgs { flags = 'FUZZY|TABS' },
  },
  { key = 'l', mods = 'ALT', action = wezterm.action.ShowLauncher },
}





-- ==================== Backgroud stuff ==========================
local dimmer = { brightness = 0.02, hue = 1.0, saturation = 0.5 }
local dimmer2 = { brightness = 0.03, hue = 1.0, saturation = 1.0 }


if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  config.background = {
    {
      source = { File = 'c:/users/osto/.config/wezterm/bg.jpg'},
      hsb = dimmer
    }
  }

  config.background = {
    {

      source = { File = 'c:/users/osto/.config/wezterm/bg.jpg'},
      repeat_x = 'Mirror',
      hsb = dimmer,
      -- When the viewport scrolls, move this layer 10% of the number of
      -- pixels moved by the main viewport. This makes it appear to be
      -- further behind the text.
      -- attachment = { Parallax = 0.1 },    
    },
    {
      source = { File = 'c:/users/osto/.config/wezterm/over.jpg'},
      width = '100%',
      repeat_x = 'NoRepeat',

      -- position the spins starting at the bottom, and repeating every
      -- two screens.
      vertical_align = 'Bottom',
      repeat_y_size = '100%',
      hsb = dimmer2,

      -- The parallax factor is higher than the background layer, so this
      -- one will appear to be closer when we scroll
      attachment = { Parallax = 0.2 },     
    }
  }
  
else 
  
  config.background = {
    {
      source = { File = '.config/wezterm/bg.jpg'},

      repeat_x = 'Mirror',
      hsb = dimmer,
      -- When the viewport scrolls, move this layer 10% of the number of
      -- pixels moved by the main viewport. This makes it appear to be
      -- further behind the text.
      -- attachment = { Parallax = 0.1 },    
    },
    {
      source = { File = '.config/wezterm/over.png'},
      width = '100%',
      repeat_x = 'NoRepeat',

      -- position the spins starting at the bottom, and repeating every
      -- two screens.
      vertical_align = 'Bottom',
      repeat_y_size = '100%',
      hsb = dimmer2,

      -- The parallax factor is higher than the background layer, so this
      -- one will appear to be closer when we scroll
      attachment = { Parallax = 0.05 },     
    }
  }

end




-- and finally, return the configuration to wezterm
return config


