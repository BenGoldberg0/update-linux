# Linux System Update Script

A universal Linux system update script that automatically detects your distro and updates all installed package managers.

## Features

- **Auto-detects Linux distribution** and tries to use the appropriate package manager
- Updates system packages for:
  - Debian/Ubuntu (apt)
  - Red Hat/Fedora/CentOS (dnf/yum)
  - Arch Linux (pacman)
  - openSUSE/SUSE (zypper)
  - Alpine Linux (apk)
- Updates additional package managers if installed:
  - Flatpak applications
  - Snap packages
  - Firmware updates (via fwupdmgr)
  - Homebrew packages
- Automatically reboots system after updates complete

## Usage

```bash
# Make the script executable
chmod +x main.sh

# Run the script
./main.sh
```

**Note:** The script requires sudo privileges and will prompt for your password.

## What It Does

1. Detects your Linux distribution
2. Updates system packages using the native package manager
3. Checks for and updates Flatpak applications (if installed)
4. Checks for and updates Snap packages (if installed)
5. Checks for and updates system firmware (if fwupdmgr is installed)
6. Checks for and updates Homebrew packages (if installed)
7. Reboots the system to apply all updates

## Supported Distributions

- Debian and derivatives (Ubuntu, Kali, Linux Mint, Pop!_OS, etc.)
- Red Hat and derivatives (RHEL, Fedora, CentOS, AlmaLinux, Rocky Linux)
- Arch Linux and derivatives (Manjaro, EndeavourOS, etc.)
- openSUSE/SUSE Linux Enterprise
- Alpine Linux

## Warning

⚠️ **This script will automatically reboot your system after updates are complete.** Save all work before running.

## License

This script is provided as-is without any warranty. Use at your own risk.