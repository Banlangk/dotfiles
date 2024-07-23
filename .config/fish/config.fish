if status is-interactive
    function fish_greeting
    end

    function dotfiles
        git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $argv
    end

    function yy
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
            cd -- "$cwd"
        end
        rm -f -- "$tmp"
    end

    fish_vi_key_bindings

    abbr rm 'rm -i'
    abbr cp 'cp -i'
    abbr mv 'mv -i'
    abbr mkdir 'mkdir -pv'
    abbr which 'type -p'
    abbr .. 'cd ..'
    abbr ... 'cd ../..'

    alias ls='command ls -aF --color'
    alias grep='command grep --color'
    alias hx='command helix'

    fzf --fish | source
    starship init fish | source
    zoxide init fish | source
end

set -x CPLUS_INCLUDE_PATH /home/henk/.local/include/algo $CPLUS_INCLUDE_PATH
set PATH $PATH /home/henk/.local/bin
