#!/bin/bash
set -e
sudo usermod -a -G video,audio,wheel wasd

wget https://mirror.cachyos.org/cachyos-repo.tar.xz
tar xvf cachyos-repo.tar.xz && cd cachyos-repo
sudo ./cachyos-repo.sh
cd ..

sudo pacman -Syu --needed base-devel mold sccache reflector python ccache neovim lld paru

sudo cp -r ~/dotfiles/system/makepkg.conf /etc/makepkg.conf
cp ~/dotfiles/config.toml ~/.cargo/

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup default nightly
bash
rustup component add clippy
rustup component add rust-src
rustup component add rustfmt
rustup component add rust-analyzer
