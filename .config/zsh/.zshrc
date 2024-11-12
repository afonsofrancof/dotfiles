# Setup History
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
HISTSIZE=100000000
SAVEHIST=100000000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_VERIFY

#Set EDITOR AND READER
export EDITOR=nvim
export VISUAL=nvim
export READER=mupdf

#THEME
source $ZDOTDIR/themes/gruvbox_dark.zsh

#Prompt
fpath+=$ZDOTDIR/prompts/pure
autoload -U promptinit; promptinit
export PURE_GIT_PULL=0
prompt pure

source $ZDOTDIR/functions.zsh
source $ZDOTDIR/plugins.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/.miniforge3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/.miniforge3/etc/profile.d/conda.sh" ]; then
        . "$HOME/.miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/.miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "$HOME/.miniforge3/etc/profile.d/mamba.sh" ]; then
    . "$HOME/.miniforge3/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

if [[ $(uname) == "Darwin" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

