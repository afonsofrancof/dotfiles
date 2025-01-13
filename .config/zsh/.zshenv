#This is used to reload the instance
if [[ ! $(tty) =~ ^/dev/tty[0-9]*$ ]]; then
    TRAPUSR1() {
        if [[ -o INTERACTIVE ]]; then
            exec "${SHELL}"
        fi
    }
fi

export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"
export XDG_RUNTIME_DIR=/tmp

# Add exports
if [[ $(uname) == "Darwin" ]]; then
    #ONLY MACOS
    export JAVA_HOME=$(/usr/libexec/java_home)
    export PATH="/opt/homebrew/bin:$PATH"
    export PATH="/opt/homebrew/opt/texlive/bin:$PATH"
    export GEM_HOME=$HOME/.gem
    export PATH=$PATH:$GEM_HOME/bin
else
    #ONLY LINUX
    export LIBVA_DRIVER_NAME=nvidia
fi


#BOTH
export PATH="/usr/sbin:/sbin:$PATH"
export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.ghcup/bin:$PATH"
export PATH="$HOME/.miniforge3/bin:$PATH"
export PATH="$HOME/.cabal/bin:$PATH"
export PATH="$XDG_CONFIG_HOME/emacs/bin:$PATH"

export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"


. "$HOME/.cargo/env"
