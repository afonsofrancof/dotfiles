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
zvm_after_init_commands+=('source <(fzf --zsh) && enable-fzf-tab')
source $ZDOTDIR/plugins/fzf-tab/fzf-tab.plugin.zsh

# Vi mode
source $ZDOTDIR/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# MacOS
source $ZDOTDIR/plugins/zsh-macos.plugin.zsh
