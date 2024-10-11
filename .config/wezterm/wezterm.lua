local wezterm = require 'wezterm'

local config = wezterm.config_builder()

--Font config
config.font_size = 16

--Disable ligatures
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }

--Color scheme
config.color_scheme = 'Gruvbox dark, hard (base16)'

-- Remove tab bar
config.enable_tab_bar = false

-- Make it borderless
config.window_decorations = 'RESIZE'

-- Remove anoying things
config.window_close_confirmation = 'NeverPrompt'
config.audible_bell = "Disabled"

config.set_environment_variables = {
    TERM = 'xterm-256color'
}

config.bold_brightens_ansi_colors = "No"

return config
