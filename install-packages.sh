#!/bin/bash

# After downloading make sure to:
# chmod +x install-packages.sh
# sudo ./install-packages.sh

# Get the directory of the currently executing script
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Add a unique timestamp to the log file name
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
LOG_FILE="$SCRIPT_DIR/master_workflow_${TIMESTAMP}.log"

# Define a logging function
log_message() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

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
▌ ▌▛▌▌▌▚▘  ▛▌█▌▐ ▛▌█▌▛▘ Linux System Post Install Script
▙▖▌▌▌▙▌▞▖  ▌▌▙▖▐▖▙▌▙▖▌  by: Thor 
                 ▌      Version: 1.02 (Dec 18, 2025)

EOF
}

# Clear screen and show logo
clear
print_logo
log_message "INFO: Starting Linux System Post Install Script"

if [ $EUID -ne 0 ]; then
    # ... use log_message for consistent output
    log_message "ERROR: This script requires elevated privileges. Exiting."
    exit 1
fi

# Before everything, we have to make sure that system fully updates
log_message "INFO: Running system DNF update..."
dnf upgrade --refresh -y
# Since set -e is active, we don't need 'if [ $? -ne 0 ]', it handles the failure.
log_message "INFO: DNF update complete."
log_message "INFO: Running FLATPAK update..."
flatpak update --assumeyes
log_message "INFO: FLATPAK update complete."


######## FLATPAK PACKAGE INSTALLATION
log_message "TASK: Starting FLATPAK package installation."

# List of FLATPAK packages to install
packages=(
    com.mattjakeman.ExtensionManager
    io.github.kolunmi.Bazaar
    io.missioncenter.MissionCenter
    org.gnome.FontManager
    com.visualstudio.code
    net.lutris.Lutris
    com.heroicgameslauncher.hgl
)

# Use a for loop that checks the exit code of each flatpak install
for package in "${packages[@]}"; do
    log_message "INFO: Attempting to install Flatpak package: $package"
    
    # Run command and check exit status manually for better logging
    flatpak install -y "$package"
    
    if [ $? -ne 0 ]; then
        log_message "WARNING: Installation of $package failed. Continuing with next package..."
    else
        log_message "SUCCESS: $package installed."
    fi
done

log_message "INFO: FLATPAK package installation complete."


######## DNF PACKAGE INSTALLATION
log_message "TASK: Starting DNF package installation."

# List of DNF packages to install
dnf_packages=(
    "yaru-sound-theme"
    "mc"
    "htop"
    "alacritty"
    "fastfetch"
    "gnome-tweaks"
    "gnome-firmware"
    "steam"
    "gcc"
    "make"
    # Add any other package names here (e.g., 'vlc', 'gimp', etc.)
)

# Loop through DNF packages
# Note: 'set -e' is disabled within this loop so errors don't halt execution
for package in "${dnf_packages[@]}"; do
    log_message "INFO: Attempting to install DNF package: $package"
    dnf install -y "$package"
    
    if [ $? -ne 0 ]; then
        log_message "WARNING: Failed to install DNF package $package. Continuing..."
    else
        log_message "SUCCESS: $package installed."
    fi
done

log_message "INFO: DNF package installation complete."

# The script should then end with:
log_message "INFO: All tasks complete. Script finished successfully."
