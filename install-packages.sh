#!/bin/bash

# After downloading nake sure to:
# chmod +x install-packages.sh
# sudo ./install-packages.sh

# Print the logo
print_logo() {
	cat << "EOF"

▖ ▘        ▌   ▜       
▌ ▌▛▌▌▌▚▘  ▛▌█▌▐ ▛▌█▌▛▘ Linux System Post Install Tool
▙▖▌▌▌▙▌▞▖  ▌▌▙▖▐▖▙▌▙▖▌  by: Thor 
                 ▌      Version: 0.01 (Dec 7, 2025)

EOF
}

# Clear screen and show logo
clear
print_logo

# Exit on any error
set -e

if [ $EUID -ne 0 ]; then
  echo "This script requires elevated privileges. Run with: sudo $0" 1>&2
  exit 1
fi

# List Flatpak packages to install
packages=(
	com.mattjakeman.ExtensionManager
	io.github.kolunmi.Bazaar
	io.missioncenter.MissionCenter
	org.gnome.FontManager
)

for package in ${packages[@]}; do
	flatpak install --user --assumeyes ${package}
done
