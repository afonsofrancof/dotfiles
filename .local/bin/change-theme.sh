#!/bin/zsh

# Ignore errors
set +e

# Declare theme configurations
typeset -A themes
themes[catppuccin-latte]=\
'ghostty_theme_name=catppuccin-latte
 nvim_color_scheme=catppuccin-latte'

themes[catppuccin-frappe]=\
 'ghostty_theme_name=catppuccin-frappe
 nvim_color_scheme=catppuccin-frappe'

themes[gruvbox-original-hard-dark]=\
'ghostty_theme_name=GruvboxDarkHard
 nvim_color_scheme=gruvbox-material
 additional_nvim_commands="\
vim.g.gruvbox_material_better_performance=1
vim.g.gruvbox_material_background=\"hard\"
vim.g.gruvbox_material_foreground=\"original\"
vim.g.gruvbox_material_transparent_background=2
vim.opt.background=\"dark\""'

themes[gruvbox-original-medium-light]=\
'ghostty_theme_name=GruvboxLight
 nvim_color_scheme=gruvbox-material
 additional_nvim_commands="\
vim.g.gruvbox_material_better_performance=1
vim.g.gruvbox_material_background=\"medium\"
vim.g.gruvbox_material_foreground=\"original\"
vim.g.gruvbox_material_transparent_background=2
vim.opt.background=\"light\""'

themes[gruvbox-material-hard-dark]=\
'alacritty_theme_name=gruvbox_dark
 ghostty_theme_name=gruvbox-material-hard-dark
 nvim_color_scheme=gruvbox-material
 background_color=#1d2021
 tmux_bar_unfocused_fg=#d4be98
 tmux_bar_focused_bg=#d4be98
 tmux_bar_focused_fg=#1d2021
 additional_nvim_commands="\
vim.g.gruvbox_material_better_performance=1
vim.g.gruvbox_material_background=\"hard\"
vim.g.gruvbox_material_foreground=\"material\"
vim.g.gruvbox_material_transparent_background=2
vim.opt.background=\"dark\""
 kitty_theme="Gruvbox Material Dark Hard"'

themes[gruvbox-material-medium-dark]=\
'ghostty_theme_name=gruvbox-material-medium-dark
 nvim_color_scheme=gruvbox-material
 additional_nvim_commands="\
vim.g.gruvbox_material_better_performance=1
vim.g.gruvbox_material_background=\"medium\"
vim.g.gruvbox_material_foreground=\"material\"
vim.g.gruvbox_material_transparent_background=2
vim.opt.background=\"dark\""'

themes[gruvbox-material-soft-dark]=\
 'ghostty_theme_name=gruvbox-material-soft-dark
 nvim_color_scheme=gruvbox-material
 additional_nvim_commands="\
vim.g.gruvbox_material_better_performance=1
vim.g.gruvbox_material_background=\"soft\"
vim.g.gruvbox_material_foreground=\"material\"
vim.g.gruvbox_material_transparent_background=2
vim.opt.background=\"dark\""'

themes[gruvbox-material-hard-light]=\
 'ghostty_theme_name=gruvbox-material-hard-light
 nvim_color_scheme=gruvbox-material
 additional_nvim_commands="\
vim.g.gruvbox_material_better_performance=1
vim.g.gruvbox_material_background=\"hard\"
vim.g.gruvbox_material_foreground=\"material\"
vim.g.gruvbox_material_transparent_background=2
vim.opt.background=\"light\""'

themes[gruvbox-material-medium-light]=\
 'ghostty_theme_name=gruvbox-material-medium-light
 nvim_color_scheme=gruvbox-material
 additional_nvim_commands="\
vim.g.gruvbox_material_better_performance=1
vim.g.gruvbox_material_background=\"medium\"
vim.g.gruvbox_material_foreground=\"material\"
vim.g.gruvbox_material_transparent_background=2
vim.opt.background=\"light\""'

themes[gruvbox-material-soft-light]=\
 'ghostty_theme_name=gruvbox-material-soft-light
 nvim_color_scheme=gruvbox-material
 additional_nvim_commands="\
vim.g.gruvbox_material_better_performance=1
vim.g.gruvbox_material_background=\"soft\"
vim.g.gruvbox_material_foreground=\"material\"
vim.g.gruvbox_material_transparent_background=2
vim.opt.background=\"light\""'

themes[everforest-hard-dark]=\
'ghostty_theme_name=everforest-hard-dark
 nvim_color_scheme=everforest
 additional_nvim_commands="\
vim.g.everforest_better_performance=1
vim.g.everforest_transparent_background=2
vim.g.everforest_background=\"hard\"
vim.opt.background=\"dark\""'
 
themes[everforest-medium-dark]=\
'ghostty_theme_name=everforest-medium-dark
 nvim_color_scheme=everforest
 additional_nvim_commands="\
vim.g.everforest_better_performance=1
vim.g.everforest_transparent_background=2
vim.g.everforest_background=\"medium\"
vim.opt.background=\"dark\""'

themes[everforest-soft-dark]=\
'ghostty_theme_name=everforest-soft-dark
 nvim_color_scheme=everforest
 additional_nvim_commands="\
vim.g.everforest_better_performance=1
vim.g.everforest_background=\"soft\"
vim.g.everforest_transparent_background=2
vim.opt.background=\"dark\""'

# Function to reload Neovim
reload_neovim() {
    local scheme=$1
    local extra_cmds=$2
    echo "$extra_cmds" > ~/.config/nvim/lua/core/theme.lua
    echo "vim.cmd('colorscheme ${scheme}')" >> ~/.config/nvim/lua/core/theme.lua
    for addr in $XDG_RUNTIME_DIR/nvim.*; do
        nvim --server "$addr" --remote-send ":source ~/.config/nvim/lua/core/theme.lua<CR>" || true
    done
}

# Change common settings
change_theme() {
    [[ -n "$ghostty_theme_name" ]] && sed -i '' -E "s/theme =.*$/theme = $ghostty_theme_name/" ~/.config/ghostty/config
    reload_neovim "$nvim_color_scheme" "$additional_nvim_commands"
}

# Menu selection
theme_selection=$(printf '%s\n' "${(@k)themes}" | fzf --prompt="Select a theme: ")
if [[ -n "$theme_selection" ]]; then
    eval "${themes[$theme_selection]}"
    change_theme
    echo "Theme '${theme_selection}' applied successfully."
else
    echo "No theme selected. Exiting."
    exit 1
fi


