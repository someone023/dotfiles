#!/bin/bash

sudo systemctl enable --now auto-cpufreq
sudo systemctl enable --now thermald
sudo systemctl enable --now fstrim
sudo systemctl enable --now rtkit-daemon
sudo systemctl enable --now acpid.service
sudo systemctl enable --now irqbalance
sudo systemctl enable --now ananicy-cpp
#sudo systemctl enable --now iwd.service
#sudo systemctl enable --now ntpd.service
sudo systemctl enable keyd
sudo systemctl enable avahi-daemon

sudo systemctl disable bluetooth
sudo systemctl mask bluetooth

sudo cp default.conf /etc/keyd/

echo "Syncing configuration directories..."
rsync -av ~/dotfiles/config/ ~/.config
cp ~/dotfiles/.wezterm.lua ~/

sudo keyd reload
curl -fssL https://github.com/mrquantumoff/razer-nari-pipewire-profile/raw/master/autoinstall.sh | sh
