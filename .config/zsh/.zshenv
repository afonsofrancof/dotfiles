export EDITOR=nvim
export VISUAL=nvim
export READER=mupdf

export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"
export XDG_RUNTIME_DIR=/tmp

export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"

# OS-specific exports
if [[ $(uname) == "Darwin" ]]; then
    export JAVA_HOME=$(/usr/libexec/java_home)
    export GEM_HOME=$HOME/.gem
    export PATH="/opt/homebrew/bin:$PATH"
    export PATH="/opt/homebrew/opt/texlive/bin:$PATH"
    export PATH=$PATH:$GEM_HOME/bin
fi


#BOTH
export PATH="/usr/sbin:/sbin:$PATH"
export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.ghcup/bin:$PATH"
export PATH="$HOME/.cabal/bin:$PATH"

. "$HOME/.cargo/env"
