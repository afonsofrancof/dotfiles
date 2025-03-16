function vim
    if test -z "$argv"
        if test -f "./.session.vim"
            nvim -S .session.vim -c 'lua vim.g.savesession = true'
        else
            nvim -c 'lua vim.g.savesession = true'
        end
    else
        nvim $argv
    end
end

function routevpn
    sudo route -n add $argv 10.8.0.1
end

# Aliases
alias ls="eza --icons -l --sort type"
alias lg="lazygit"
alias routes="netstat -rn -f inet"
alias lc="lazygit --work-tree=$HOME --git-dir=$HOME/dotfiles"
alias config="git --work-tree=$HOME --git-dir=$HOME/dotfiles"
alias nvim_update='nvim --headless "+Lazy! sync" +qa'

function qmk_flash_right
    echo "Flashing right side, waiting 5 seconds"
    sleep 5
    qmk flash -kb lily58 -km afonso -bl avrdude-split-right
end

function qmk_flash_left
    echo "Flashing left side, waiting 5 seconds"
    sleep 5
    qmk flash -kb lily58 -km afonso -bl avrdude-split-left
end

function cd
    builtin cd $argv; and ls
end
