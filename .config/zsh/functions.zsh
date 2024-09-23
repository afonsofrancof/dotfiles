function vim {
    if [[ -z "$@" ]]; then
        if [[ -f "./.session.vim" ]]; then
            nvim -S .session.vim --listen /tmp/nvim.pipe -c 'lua vim.g.savesession = true'
        else
            nvim --listen /tmp/nvim.pipe -c 'lua vim.g.savesession = true'
        fi
    else
        nvim --listen /tmp/nvim.pipe "$@"
    fi
}

function sourceall(){
    set -e
    pids=$(pgrep zsh)
    while IFS= read -r pid; do
        kill -USR1 "$pid"
    done <<< "$pids"
    set +e
}


function routevpn {
        sudo route -n add $@ 10.8.0.1
}

alias ls="eza --icons -l --sort type"
alias lg="lazygit"
alias calcurse-caldav='CALCURSE_CALDAV_PASSWORD=$(keyring get caldav afonso) calcurse-caldav'
alias routes="netstat -rn -f inet"

alias lc='lazygit --work-tree="$HOME" --git-dir="$HOME/dotfiles"'
alias config='git --work-tree="$HOME" --git-dir="$HOME/dotfiles"'

function qmk_flash_right(){
    echo "Flashing right side, waiting 5 seconds"
    sleep 5
    qmk flash -kb lily58 -km afonso -bl avrdude-split-right
}

function qmk_flash_left(){
    echo "Flashing left side, waiting 5 seconds"
    sleep 5
    qmk flash -kb lily58 -km afonso -bl avrdude-split-left
}

alias nvim_update='nvim --headless "+Lazy! sync" +qa'
