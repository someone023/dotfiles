#!/bin/bash
set -e
sudo usermod -a -G video,audio,wheel wasd

wget https://mirror.cachyos.org/cachyos-repo.tar.xz
tar xvf cachyos-repo.tar.xz && cd cachyos-repo
sudo ./cachyos-repo.sh
cd ..

sudo pacman -Syu --needed base-devel mold reflector rustup archlinux-keyring python ccache neovim

sudo cp -r ~/dotfiles/system/makepkg.conf /etc/makepkg.conf

rustup default nightly

sudo reflector --country Germany --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
