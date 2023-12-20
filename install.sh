#!/bin/bash

# Define the files containing the list of packages
PACMAN_PACKAGE_FILE="packages.txt"
AUR_PACKAGE_FILE="aur_packages.txt"

# Function to install packages from a list
install_packages() {
	local package_file=$1
	local installer_cmd=$2

	# Check if the package file exists
	if [ ! -f "$package_file" ]; then
		echo "Package file not found: $package_file"
		return 1
	fi

	# Read the package names from the file and store them in an array
	readarray -t packages <"$package_file"

	# Install the packages
	$installer_cmd "${packages[@]}"
}

sudo reflector --country Germany --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist

# Update the system and install pacman packages
install_packages "$PACMAN_PACKAGE_FILE" "sudo pacman -Syyu --needed --noconfirm" || exit 1

# Install AUR packages with yay
install_packages "$AUR_PACKAGE_FILE" "yay -S --needed --noconfirm" || exit 1

# Enable and start thermald service
echo "Enabling and starting thermald service..."
sudo systemctl enable thermald
sudo systemctl start thermald
sudo systemctl enable keyd
sudo systemctl start keyd

# Clone LazyVim configuration
echo "Cloning LazyVim configuration..."
rm -rf ~/.config/nvim
git clone https://github.com/LazyVim/starter ~/.config/nvim

# Copy configuration files
echo "Copying configuration files..."
cp .gitconfig ~/.gitconfig
cp -r plugins ~/.config/nvim/lua/
cp .zshrc ~
sudo cp default.conf /etc/keyd/

# Sync configuration directories
echo "Syncing configuration directories..."
rsync -av config/ ~/.config

sudo keyd reload

curl -fssL https://github.com/mrquantumoff/razer-nari-pipewire-profile/raw/master/autoinstall.sh | sh



sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
