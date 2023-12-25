#!/bin/bash

sudo usermod -a -G video,audio,wheel wasd

sudo pacman -S --needed base-devel reflector rustup archlinux-keyring

sudo pacman-key --populate

sudo cp pacman.conf /etc/pacman.conf
sudo reflector --country Germany --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist

sudo pacman -Syyu
rustup default nightly

git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

cd ..
rm -rf paru
