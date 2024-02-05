if status is-interactive
    # Commands to run in interactive sessions can go here
end
function fish_greeting
end
starship init fish | source

set -Ux CC clang
set -Ux CXX clang++


alias cat='bat --theme="Dracula" --style=plain'

function grep --description 'Alias for grep with color'
    command grep --color $argv
end

function ip --description 'Alias for ip with color'
    command ip --color $argv
end

function l --description 'Alias for eza -l'
    eza -l $argv
end

function ls --description 'Alias for eza -la'
    eza -h --git --icons --color=auto --group-directories-first -s extension $argv
end

function la --description 'Alias for eza -la'
    eza -a -h --git --icons --color=auto --group-directories-first -s extension $argv
end
function lt --description 'Alias for eza -la'
    eza --tree $argv
end

function fcd --description 'fuzzy cd'
    cd (find . -type d | fzf | string escape --style=script) $argv
end

alias rmf='rm -rf'
alias v='neovide'
alias vi='neovide'
alias vim='neovide'
alias sc='sudo systemctl'
alias jc='sudo journalctl -b -p err'
alias diff='diff --color=auto'
