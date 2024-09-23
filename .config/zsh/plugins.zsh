#Completions
ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd history completion)
zstyle ':completion:*' rehash true
fpath+=$ZDOTDIR/plugins/zsh-completions/src
autoload -U compinit && compinit
source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh

source $ZDOTDIR/plugins/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh

source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

zvm_after_init_commands+=('source <(fzf --zsh) && enable-fzf-tab')
source $ZDOTDIR/plugins/fzf-tab/fzf-tab.plugin.zsh

source $ZDOTDIR/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

source $ZDOTDIR/plugins/zsh-macos.plugin.zsh

source $ZDOTDIR/plugins/zsh-git.plugin.zsh

source $ZDOTDIR/plugins/zsh-sudo.plugin.zsh

source $ZDOTDIR/plugins/zsh-tmux/zsh-tmux.plugin.zsh
