if [[ -o interactive ]]; then
    if [[ -z "$TMUX" ]]; then
        tmux new-session -A -s 0
    fi
fi

source $ZDOTDIR/setup-history.zsh
source $ZDOTDIR/prompts/simple-two-line.zsh
source $ZDOTDIR/functions.zsh
source $ZDOTDIR/plugins.zsh
source $ZDOTDIR/theme.zsh

if [[ $(uname) == "Darwin" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

eval "$(atuin init zsh --disable-up-arrow)"

