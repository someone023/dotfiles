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

# Update the system and install pacman packages
install_packages "$PACMAN_PACKAGE_FILE" "sudo pacman -Syu --needed --noconfirm" || exit 1

# Install AUR packages with yay
install_packages "$AUR_PACKAGE_FILE" "yay -S --needed --noconfirm" || exit 1

curl -fssL https://github.com/mrquantumoff/razer-nari-pipewire-profile/raw/master/autoinstall.sh | sh

#!/bin/bash

# Enable and start thermald service
echo "Enabling and starting thermald service..."
sudo systemctl enable thermald
sudo systemctl start thermald

# Clone LazyVim configuration
echo "Cloning LazyVim configuration..."
rm -rf ~/.config/nvim
git clone https://github.com/LazyVim/starter ~/.config/nvim

# Copy configuration files
echo "Copying configuration files..."
cp .gitconfig ~/.gitconfig
cp config.fish ~/.config/fish/
cp -r plugins ~/.config/nvim/lua/

# Sync configuration directories
echo "Syncing configuration directories..."
rsync -av config/ ~/.config

# Change default shell to fish
echo "Changing default shell to fish..."
chsh -s /usr/bin/fish
