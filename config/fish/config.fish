if status is-interactive
    # Commands to run in interactive sessions can go here
end
function fish_greeting
    echo (set_color 89dceb; date; set_color normal)
end
starship init fish | source

alias bat='bat --theme="Catppuccin-mocha"'

set MOZ_ENABLE_WAYLAND 1
set XDG_CURRENT_DESKTOP sway


function grep --description 'Alias for grep with color'
    command grep --color $argv
end

function ip --description 'Alias for ip with color'
    command ip --color $argv
end

function l --description 'Alias for eza -l'
    lsd -l $argv
end

function ls --description 'Alias for eza -la'
    lsd $argv
end

function la --description 'Alias for eza -la'
    lsd -a $argv
end
function lt --description 'Alias for eza -la'
    lsd --tree $argv
end


function ppc --description 'Alias for powerprofilesctl'
    powerprofilesctl $argv
end


function pb --description 'Alias for powerprofilesctl in performance mode'
    powerprofilesctl set balanced $argv
end


function pf --description 'Alias for powerprofilesctl in performance mode'
    powerprofilesctl set performance $argv
end

function ps --description 'Alias for powerprofilesctl in power save mode'
    powerprofilesctl set power-saver $argv
end
