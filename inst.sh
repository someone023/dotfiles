#!/bin/bash

# Update system and install packages with pacman
sudo pacman -Syu --needed font-manager atuin tree-sitter gitlab-runner neovim ttf-nerd-fonts-symbols fzf docker rustup ripgrep ttf-font-awesome ttf-jetbrains-mono-nerd fd kitty lsd fish qt6-wayland wireplumber alacritty starship nodejs npm tor tk brightnessctl polkit-kde-agent pamixer lazygit bat wofi ctags thermald xournalpp wl-clipboard zoxide btop cgdb libva-intel-driver vulkan-intel intel-ucode ttf-iosevka-nerd clang lldb gtest doxygen cmake

# Install packages with yay
yay -S --needed hyprland-git thorium-browser-bin webcord nwg-look xdg-desktop-portal-hyprland-git hyprpaper-git beautyline catppuccin-gtk-theme-mocha mako visual-studio-code-bin catppuccin-cursors-mocha

sudo systemctl disable lightdm

# Enable and start thermald service
sudo systemctl enable thermald
sudo systemctl start thermald

# Clone LazyVim configuration
rm -rf ~/.config/nvim
git clone https://github.com/LazyVim/starter ~/.config/nvim

# Copy configuration files
cp .gitconfig ~/.gitconfig
cp config.fish ~/.config/fish/
cp -r plugins ~/.config/nvim/lua/
# Sync configuration directories
rsync -av config/ ~/.config

# Change default shell to fish
chsh -s /usr/bin/fish
# Install and configure fish shell
fish
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
fisher install jorgebucaran/fisher
fisher install catppuccin/fish
fish -c "fish_config theme save 'Catppuccin Mocha'"
fisher install jethrokuan/z
fisher install decors/fish-colored-man
fisher install acomagu/fish-async-prompt
