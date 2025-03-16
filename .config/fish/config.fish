if status is-interactive
and not set -q TMUX
  tmux new-session -A -s 0
end

set -g fish_greeting
fish_vi_key_bindings
bind -M insert \t "__fzf_complete"

# XDG directories
set -x XDG_CONFIG_HOME "$HOME/.config"
set -x XDG_CACHE_HOME "$HOME/.cache"
set -x XDG_DATA_HOME "$HOME/.local/share"
set -x XDG_STATE_HOME "$HOME/.local/state"
set -x XDG_RUNTIME_DIR /tmp

set -x EDITOR nvim
set -x VISUAL nvim
set -x READER mupdf

set -x GOPATH "$HOME/go"
set -x GOBIN "$GOPATH/bin"

# OS-specific exports
if test (uname) = "Darwin"
    set -x JAVA_HOME (eval /usr/libexec/java_home)
    set -x GEM_HOME "$HOME/.gem"
    fish_add_path /opt/homebrew/bin
    fish_add_path /opt/homebrew/opt/texlive/bin
    fish_add_path $GEM_HOME/bin
end

# Common paths
fish_add_path /usr/sbin
fish_add_path /sbin
fish_add_path $HOME/opt/*/bin
fish_add_path $HOME/.local/share/nvim/mason/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/go/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.ghcup/bin
fish_add_path $HOME/.cabal/bin

if test (uname) = "Darwin"
    eval (/opt/homebrew/bin/brew shellenv)
end

# Set up fzf
set -U FZF_DEFAULT_OPTS "--bind 'bs:backward-delete-char/eof'"
fzf --fish | source
