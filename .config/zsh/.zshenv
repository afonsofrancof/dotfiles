#This is used to reload the instance
TRAPUSR1() {
    if [[ -o INTERACTIVE ]]; then
        exec "${SHELL}"
    fi
}


# Add exports
if [[ $(uname) == "Darwin" ]]; then
    #ONLY MACOS
    export JAVA_HOME="/opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home"
    export PATH="/opt/homebrew/bin:$PATH"
    export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
    export PATH="/opt/homebrew/opt/texlive/bin:$PATH"
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

export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"

