autoload -Uz vcs_info
precmd() {
    vcs_info
    setopt PROMPT_SUBST
    if [[ -n "$vcs_info_msg_0_" ]]; then
        PROMPT='%F{blue}%~%F{yellow} (${vcs_info_msg_0_})%f'$'\n''%F{magenta}❯ '
    else
        PROMPT='%F{blue}%~%f'$'\n''%F{magenta}❯ '
    fi
    print -P ""
}

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats '%b'

# Simple prompt initialization
autoload -U promptinit; promptinit
