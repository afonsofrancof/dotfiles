#!/bin/zsh

# Ignore errors
set +e

# Declare theme configurations
typeset -A themes
themes[catppuccin-latte]=\
'alacritty_theme_name=catppuccin_latte
 ghostty_theme_name=catppuccin-latte
 zsh_theme_name=catppuccin_latte
 nvim_color_scheme=catppuccin-latte
 background_color=#eff1f5
 tmux_bar_unfocused_fg=#4c4f69
 tmux_bar_focused_bg=#4c4f69
 tmux_bar_focused_fg=#eff1f5
 kitty_theme="Catppuccin-Latte"'

themes[catppuccin-frappe]=\
'alacritty_theme_name=catppuccin_frappe
 ghostty_theme_name=catppuccin-frappe
 zsh_theme_name=catppuccin_frappe
 nvim_color_scheme=catppuccin-frappe
 background_color=#303446
 tmux_bar_unfocused_fg=#c6d0f5
 tmux_bar_focused_bg=#c6d0f5
 tmux_bar_focused_fg=#303446
 kitty_theme="Catppuccin-Frappe"'

themes[gruvbox-original-hard-dark]=\
'alacritty_theme_name=gruvbox_dark
 ghostty_theme_name=GruvboxDarkHard
 zsh_theme_name=gruvbox_dark
 nvim_color_scheme=gruvbox-material
 background_color=#1d2021
 tmux_bar_unfocused_fg=#ebdbb2
 tmux_bar_focused_bg=#ebdbb2
 tmux_bar_focused_fg=#1d2021
 additional_nvim_commands="\
vim.g.gruvbox_material_better_performance=1
vim.g.gruvbox_material_background=\"hard\"
vim.g.gruvbox_material_foreground=\"original\"
vim.opt.background=\"dark\""
 kitty_theme="Gruvbox Dark Hard"'

themes[gruvbox-material-hard-dark]=\
'alacritty_theme_name=gruvbox_dark
 ghostty_theme_name=gruvbox-material-hard-dark
 zsh_theme_name=gruvbox_dark
 nvim_color_scheme=gruvbox-material
 background_color=#1d2021
 tmux_bar_unfocused_fg=#d4be98
 tmux_bar_focused_bg=#d4be98
 tmux_bar_focused_fg=#1d2021
 additional_nvim_commands="\
vim.g.gruvbox_material_better_performance=1
vim.g.gruvbox_material_background=\"hard\"
vim.g.gruvbox_material_foreground=\"material\"
vim.opt.background=\"dark\""
 kitty_theme="Gruvbox Material Dark Hard"'

themes[gruvbox-material-medium-dark]=\
'alacritty_theme_name=gruvbox_dark
 ghostty_theme_name=gruvbox-material-medium-dark
 zsh_theme_name=gruvbox_dark
 nvim_color_scheme=gruvbox-material
 background_color=#282828
 tmux_bar_unfocused_fg=#d4be98
 tmux_bar_focused_bg=#d4be98
 tmux_bar_focused_fg=#282828
 additional_nvim_commands="\
vim.g.gruvbox_material_better_performance=1
vim.g.gruvbox_material_background=\"medium\"
vim.g.gruvbox_material_foreground=\"material\"
vim.opt.background=\"dark\""
 kitty_theme="Gruvbox Material Dark Medium"'

themes[gruvbox-material-soft-dark]=\
'alacritty_theme_name=gruvbox_dark
 ghostty_theme_name=gruvbox-material-soft-dark
 zsh_theme_name=gruvbox_dark
 nvim_color_scheme=gruvbox-material
 background_color=#32302f
 tmux_bar_unfocused_fg=#d4be98
 tmux_bar_focused_bg=#d4be98
 tmux_bar_focused_fg=#32302f
 additional_nvim_commands="\
vim.g.gruvbox_material_better_performance=1
vim.g.gruvbox_material_background=\"soft\"
vim.g.gruvbox_material_foreground=\"material\"
vim.opt.background=\"dark\""
 kitty_theme="Gruvbox Material Dark Soft"'

themes[gruvbox-material-hard-light]=\
'alacritty_theme_name=gruvbox_light
 ghostty_theme_name=gruvbox-material-hard-light
 zsh_theme_name=gruvbox_light
 nvim_color_scheme=gruvbox-material
 background_color=#f9f5d7
 tmux_bar_unfocused_fg=#654735
 tmux_bar_focused_bg=#654735
 tmux_bar_focused_fg=#f9f5d7
 additional_nvim_commands="\
vim.g.gruvbox_material_better_performance=1
vim.g.gruvbox_material_background=\"hard\"
vim.g.gruvbox_material_foreground=\"material\"
vim.opt.background=\"light\""
 kitty_theme="Gruvbox Material Light Hard"'

themes[gruvbox-material-medium-light]=\
'alacritty_theme_name=gruvbox_light
 ghostty_theme_name=gruvbox-material-medium-light
 zsh_theme_name=gruvbox_light
 background_color=#fbf1c7
 tmux_bar_unfocused_fg=#654735
 tmux_bar_focused_bg=#654735
 tmux_bar_focused_fg=#fbf1c7
 nvim_color_scheme=gruvbox-material
 additional_nvim_commands="\
vim.g.gruvbox_material_better_performance=1
vim.g.gruvbox_material_background=\"medium\"
vim.g.gruvbox_material_foreground=\"material\"
vim.opt.background=\"light\""
 kitty_theme="Gruvbox Material Light Medium"'

themes[gruvbox-material-soft-light]=\
'alacritty_theme_name=gruvbox_light
 ghostty_theme_name=gruvbox-material-soft-light
 zsh_theme_name=gruvbox_light
 background_color=#f2e5bc
 tmux_bar_unfocused_fg=#654735
 tmux_bar_focused_bg=#654735
 tmux_bar_focused_fg=#f2e5bc
 nvim_color_scheme=gruvbox-material
 additional_nvim_commands="\
vim.g.gruvbox_material_better_performance=1
vim.g.gruvbox_material_background=\"soft\"
vim.g.gruvbox_material_foreground=\"material\"
vim.opt.background=\"light\""
 kitty_theme="Gruvbox Material Light Soft"'

themes[gruvbox-original-medium-light]=\
'alacritty_theme_name=gruvbox_light
 ghostty_theme_name=GruvboxLight
 zsh_theme_name=gruvbox_light
 nvim_color_scheme=gruvbox-material
 background_color=#fbf1c7
 tmux_bar_unfocused_fg=#3c3836
 tmux_bar_focused_bg=#3c3836
 tmux_bar_focused_fg=#fbf1c7
 additional_nvim_commands="\
vim.g.gruvbox_material_better_performance=1
vim.g.gruvbox_material_background=\"medium\"
vim.g.gruvbox_material_foreground=\"original\"
vim.opt.background=\"light\""
 kitty_theme="Gruvbox Light Medium"'

# Function to reload Zsh sessions
reload_zsh_sessions() {
    local pids
    pids=$(pgrep zsh)
    for pid in $pids; do
        kill -USR1 "$pid" 2>/dev/null || true
    done
}

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
    sed -i '' -e "s|import = \[\"~/.config/alacritty/themes/.*\"\]|import = [\"~/.config/alacritty/themes/${alacritty_theme_name}.toml\"]|g" ~/.config/alacritty/alacritty.toml
    sed -i '' -e "s|source \$ZDOTDIR/themes/.*zsh|source \$ZDOTDIR/themes/${zsh_theme_name}.zsh|g" "$ZDOTDIR"/.zshrc
    reload_zsh_sessions
    sed -i '' -E "s/set -g status-bg .*$/set -g status-bg \"$background_color\"/" ~/.config/tmux/tmux_status_bar.conf
    sed -i '' -E "s/set -g @unfocused-fg .*$/set -g @unfocused-fg \"$tmux_bar_unfocused_fg\"/" ~/.config/tmux/tmux_status_bar.conf
    sed -i '' -E "s/set -g @focused-bg .*$/set -g @focused-bg \"$tmux_bar_focused_bg\"/" ~/.config/tmux/tmux_status_bar.conf
    sed -i '' -E "s/set -g @focused-fg .*$/set -g @focused-fg \"$tmux_bar_focused_fg\"/" ~/.config/tmux/tmux_status_bar.conf
    tmux source-file ~/.config/tmux/tmux.conf
    [[ -n "$kitty_theme" ]] && kitten themes --reload-in=all "$kitty_theme"
    reload_neovim "$nvim_color_scheme" "$additional_nvim_commands"
    sed -i '' -E "s/theme =.*$/theme = $ghostty_theme_name/" ~/.config/ghostty/config
}

# Menu selection
theme_selection=$(printf '%s\n' "${(@k)themes}" | fzf --prompt="Select a theme: " --height=40%)
if [[ -n "$theme_selection" ]]; then
    eval "${themes[$theme_selection]}"
    change_theme
    echo "Theme '${theme_selection}' applied successfully."
else
    echo "No theme selected. Exiting."
    exit 1
fi


