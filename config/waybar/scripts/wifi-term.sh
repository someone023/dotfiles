#!/bin/sh

notify-send "Getting list of available Wi-Fi networks..."

# Open Kitty with nmcli for Wi-Fi management
kitty sh -c 'nmcli device wifi list; exec $SHELL'
# Rest of your script for toggling Wi-Fi, etc., could be manual instructions or separate scripts
# For instance, you could create separate scripts for enabling/disabling WiFi and connect to a network,
# and then run them from a Kitty terminal.
