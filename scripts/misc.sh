#!/bin/bash

sudo systemctl enable --now auto-cpufreq
sudo systemctl enable --now thermald.service
sudo systemctl enable --now fstrim.timer
sudo systemctl enable --now rtkit-daemon.service
sudo systemctl enable --now acpid.service
#sudo systemctl enable --now iwd.service
#sudo systemctl enable --now ntpd.service
sudo systemctl enable keyd
sudo systemctl enable avahi-daemon.service

rm -rf ~/.config/nvim
git clone https://github.com/LazyVim/starter ~/.config/nvim

cp .gitconfig ~/.gitconfig
cp -r ~/dotfiles/lua ~/.config/nvim/
sudo cp default.conf /etc/keyd/

echo "Syncing configuration directories..."
rsync -av ~/dotfiles/config/ ~/.config

sudo keyd reload

curl -fssL https://github.com/mrquantumoff/razer-nari-pipewire-profile/raw/master/autoinstall.sh | sh
