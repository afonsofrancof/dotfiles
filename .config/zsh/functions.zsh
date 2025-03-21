function vim {
    if [[ -z "$@" ]]; then
        if [[ -f "./.session.vim" ]]; then
            nvim -S .session.vim -c 'lua vim.g.savesession = true'
        else
            nvim -c 'lua vim.g.savesession = true'
        fi
    else
        nvim "$@"
    fi
}

function routevpn {
        sudo route -n add $@ 10.8.0.1
}

alias ls="eza --icons -l --sort type"
alias lg="lazygit"
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

alias ..="cd .."

function cd()
{
  builtin cd "$@" && ls;
}




