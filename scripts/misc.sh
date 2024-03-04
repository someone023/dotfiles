#!/bin/bash

sudo systemctl enable --now auto-cpufreq
sudo systemctl enable --now thermald
sudo systemctl enable --now rtkit-daemon
sudo systemctl enable --now acpid.service
sudo systemctl enable --now irqbalance
sudo systemctl enable keyd
sudo systemctl enable avahi-daemon

systemctl unmask power-profiles-daemon.service
systemctl enable power-profiles-daemon.service


sudo systemctl disable bluetooth
sudo systemctl mask bluetooth

sudo cp default.conf /etc/keyd/

echo "Syncing configuration directories..."
rsync -av ~/dotfiles/config/ ~/.config
cp ~/dotfiles/.wezterm.lua ~/

sudo keyd reload
