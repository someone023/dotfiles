#!/bin/bash

sudo usermod -a -G video,audio,wheel wasd

sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

sudo pacman -S --needed base-devel reflector rustup archlinux-keyring

sudo pacman-key --populate

sudo cp pacman.conf /etc/pacman.conf
sudo reflector --country Germany --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist

sudo pacman -Syyu
rustup default nightly

sudo pacman -Syu paru
