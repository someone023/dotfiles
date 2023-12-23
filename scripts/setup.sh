#!/bin/bash
sudo pacman -S --needed base-devel reflector rustup

sudo reflector --country Germany --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist

rustup default nightly

git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

cd ~/dotfiles
rm -rf scripts/paru
