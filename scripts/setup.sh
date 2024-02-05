#!/bin/bash

sudo usermod -a -G video,audio,wheel wasd

sudo pacman-key --populate
sudo pacman -Syu --needed base-devel reflector rustup archlinux-keyring python

rustup default nightly

sudo cp -r ~/dotfiles/system/makepkg.conf /etc/makepkg.conf

git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ..
rm -rf paru
paru -Syu alhp-keyring alhp-mirrorlist

sudo cp -r ~/dotfiles/system/pacman.conf /etc/pacman.conf

sudo reflector --country Germany --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist

sudo pacman -Suy
