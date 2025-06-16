# Completions
zstyle ':completion:*' rehash true
fpath+=$ZDOTDIR/plugins/zsh-completions/src
autoload -U compinit && compinit

# Autosuggestions
ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd history completion)
source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh

# Syntax Highlighting
source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

# Fzf-Tab
source $ZDOTDIR/plugins/fzf-tab/fzf-tab.plugin.zsh
enable-fzf-tab

# MacOS
source $ZDOTDIR/plugins/zsh-macos.plugin.zsh
