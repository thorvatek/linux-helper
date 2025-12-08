#!/bin/bash

# After downloading nake sure to:
# chmod +x install-packages.sh
# sudo ./install-packages.sh

########### C O N F I G U R A T I O N ###########
# Get the directory of the currently executing script
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
# Add a unique timestamp to the log file name
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
LOG_FILE="$SCRIPT_DIR/master_workflow_${TIMESTAMP}.log"
# Function to handle errors and exit gracefully
handle_error() {
    local script_name=$1
    echo "$(date): ERROR - $script_name failed to execute." | tee -a "$LOG_FILE"
    exit 1
}
# Exit on any error
set -e

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

if [ $EUID -ne 0 ]; then
  echo "This script requires elevated privileges. Run with: sudo $0" 1>&2
  exit 1
fi

# Before everything, we have to make make sure that system fully updates
sudo dnf update --assumeyes
flatpak update -y

# List Flatpak packages to install
packages=(
	com.mattjakeman.ExtensionManager
	io.github.kolunmi.Bazaar
	io.missioncenter.MissionCenter
	org.gnome.FontManager
)

for package in ${packages[@]}; do
	flatpak install --assumeyes ${package}
done
