function remove_from_path() {
    local a
    local p
    local s
    local r
    eval "p=\$$1"
    a=( ${(s/:/)p} )
    if [[ ${a[(i)${2}]} -gt ${#a} ]] && return
    for s in $a; do
        if [[ ! $s == $2 ]]; then
            [[ -z "$r" ]] && r=$s || r="$r:$s"
        fi
    done
    eval $1="$r"
}

function prepend_path() {
    [[ ! -d "$2" ]] && return
    local p
    remove_from_path "$1" "$2"
    eval "p=\$$1"
    eval export $1="$2:$p"
}

function append_path() {
    [[ ! -d "$2" ]] && return
    local p
    remove_from_path "$1" "$2"
    eval "p=\$$1"
    eval export $1="$p:$2"
}

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
    prepend_path PATH "/opt/homebrew/bin"
    prepend_path PATH "/opt/homebrew/opt/texlive/bin"
    append_path  PATH  $GEM_HOME/bin
fi

#BOTH
append_path PATH "/usr/sbin:/sbin"
append_path PATH "$HOME/.local/share/nvim/mason/bin"
append_path PATH "$HOME/.local/bin"
append_path PATH "$HOME/go/bin"
append_path PATH "$HOME/.ghcup/bin"
append_path PATH "$HOME/.cabal/bin"
append_path PATH "$HOME/.cargo/bin"
for bindir in ~/opt/*/bin(N); do
  if [[ -d "$bindir" ]]; then
    prepend_path PATH "$bindir"
  fi
done

