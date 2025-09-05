#!/bin/bash

# basic script to update system and reboot

echo "Starting system update. This may take a while..."

# Detect the package manager and run appropriate update command
if [ -f /etc/debian_version ]; then
    # Debian/Ubuntu based systems
    echo "Detected Debian/Ubuntu based system"
    sudo apt update && sudo apt upgrade -y
elif [ -f /etc/redhat-release ] || [ -f /etc/fedora-release ]; then
    # RHEL/Fedora/CentOS based systems
    echo "Detected Red Hat/Fedora based system"
    sudo dnf update -y 2>/dev/null || sudo yum update -y
elif [ -f /etc/arch-release ]; then
    # Arch Linux
    echo "Detected Arch Linux"
    sudo pacman -Syu --noconfirm
elif [ -f /etc/SUSE-release ] || [ -f /etc/SuSE-release ] || [ -f /etc/opensuse-release ]; then
    # openSUSE/SUSE
    echo "Detected SUSE/openSUSE"
    sudo zypper update -y
elif [ -f /etc/alpine-release ]; then
    # Alpine Linux
    echo "Detected Alpine Linux"
    sudo apk update && sudo apk upgrade
else
    echo "Unable to detect distribution or unsupported package manager"
    exit 1
fi

# Check if Flatpak is installed and update Flatpak packages if so.
if command -v flatpak &> /dev/null; then
    echo "Flatpak detected, updating Flatpak packages..."
    flatpak update -y
fi

# Check if Snap is installed and update Snap packages
if command -v snap &> /dev/null; then
    echo "Snap detected, updating Snap packages..."
    sudo snap refresh
fi

# Check if firmware updates are available
if command -v fwupdmgr &> /dev/null; then
    echo "Checking for firmware updates..."
    sudo fwupdmgr refresh --force
    sudo fwupdmgr update -y
fi

# Check if Homebrew is installed and update
if command -v brew &> /dev/null; then
    echo "Homebrew detected, updating Homebrew packages..."
    brew update && brew upgrade
fi

echo "Update complete. System will reboot now. Thank you for your patience."
sudo reboot
