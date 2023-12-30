#!/bin/bash

# Function to check if a package is installed
is_package_installed() {
    pacman -Qq "$1" &>/dev/null
}

# Function to install a package if it's not already installed
install_package() {
    if is_package_installed "$1"; then
        echo "$1 is already installed. Skipping..."
    else
        echo "Installing $1..."
        sudo pacman -S --noconfirm "$1"
    fi
}

# Update package databases
echo "Updating package databases..."
sudo pacman -Syu

# Check and install git if not installed
install_package "git"

# Read package names from the text file (assuming one package name per line)
while read -r package; do
    install_package "$package"
done < packages.txt

# Script completion message
echo "Installation complete!"
