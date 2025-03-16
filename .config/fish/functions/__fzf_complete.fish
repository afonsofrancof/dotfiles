function __fzf_complete -d 'fzf completion and print selection back to commandline'
    # As of 2.6, fish's "complete" function does not understand
    # subcommands. Instead, we use the same hack as __fish_complete_subcommand and
    # extract the subcommand manually.
    set -l cmd (commandline -co) (commandline -ct)

    switch $cmd[1]
        case env sudo
            for i in (seq 2 (count $cmd))
                switch $cmd[$i]
                    case '-*'
                    case '*=*'
                    case '*'
                        set cmd $cmd[$i..-1]
                        break
                end
            end
    end

    set -l cmd_lastw $cmd[-1]
    set cmd (string join -- ' ' $cmd)

    set -l initial_query ''
    test -n "$cmd_lastw"; and set initial_query --query="$cmd_lastw"

    set -l complist (complete -C$cmd)
    set -l result

    # do nothing if there is nothing to select from
    test -z "$complist"; and return

    set -l compwc (echo $complist | wc -w)
    if test $compwc -eq 1
        # if there is only one option dont open fzf
        set result "$complist"
    else

        set -l query
        string join -- \n $complist \
        | eval fzf --height=90% (string escape --no-quoted -- $initial_query) --print-query (__fzf_complete_opts) \
        | cut -f1 \
        | while read -l r
            # first line is the user entered query
            if test -z "$query"
                set query $r
            # rest of lines are selected candidates
            else
                set result $result $r
            end
          end

        # exit if user canceled
        if test -z "$query" ;and test -z "$result"
            commandline -f repaint
            return
        end

        # if user accepted but no candidate matches, use the input as result
        if test -z "$result"
            set result $query
        end
    end

    set prefix (string sub -s 1 -l 1 -- (commandline -t))
    for i in (seq (count $result))
        set -l r $result[$i]
        switch $prefix
            case "'"
                commandline -t -- (string escape -- $r)
            case '"'
                if string match '*"*' -- $r >/dev/null
                    commandline -t --  (string escape -- $r)
                else
                    commandline -t -- '"'$r'"'
                end
            case '~'
                commandline -t -- (string sub -s 2 (string escape -n -- $r))
            case '*'
                commandline -t -- $r
        end
        [ $i -lt (count $result) ]; and commandline -i ' '
    end

    commandline -f repaint
end

function __fzf_complete_opts
    if set -q FZF_DEFAULT_OPTS
        echo $FZF_DEFAULT_OPTS
    end
    echo --cycle --reverse --inline-info --no-multi --bind tab:down,btab:up
end
