if status is-interactive
    # Commands to run in interactive sessions can go here
end
function fish_greeting
end
starship init fish | source

set -Ux CC clang
set -Ux CXX clang++
set -Ux fish_user_paths /usr/lib/ccache $fish_user_paths
set -Ux EDITOR nvim


function grep --description 'Alias for grep with color'
    command grep --color $argv
end

function ip --description 'Alias for ip with color'
    command ip --color $argv
end


function fcd --description 'fuzzy cd'
    cd (find . -type d | fzf | string escape --style=script) $argv
end

alias ls='eza -a --color=always --group-directories-first --icons' # preferred listing
alias la='eza -a --color=always --group-directories-first --icons' # all files and dirs
alias ll='eza -l --color=always --group-directories-first --icons' # long format
alias lt='eza -aT --color=always --group-directories-first --icons' # tree listing
alias l.="eza -a | egrep '^\.'"


alias fixpacman="sudo rm /var/lib/pacman/db.lck"
alias rmf='rm -rf'
alias v='neovide'
alias vi='neovide'
alias vim='neovide'
alias sc='sudo systemctl'
alias jc='sudo journalctl -b -p err'
alias diff='diff --color=auto'
alias cat='bat --theme="Dracula" --style=plain'
alias jctl="journalctl -p 3 -xb"
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'


# Recent installed packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
