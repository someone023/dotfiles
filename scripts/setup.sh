#!/bin/bash

sudo usermod -a -G video,audio,wheel wasd

sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

sudo cp pacman.conf /etc/pacman.conf
sudo pacman -Syu --needed base-devel reflector rustup archlinux-keyring paru python

sudo pacman-key --populate

sudo reflector --country Germany --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist

sudo pacman -Syu
rustup default nightly
