#!/usr/bin/env bash

# Constants
readonly APPIMAGES_DIR="appimages1"
readonly APPIMAGETOOL_URL="https://github.com/AppImage/appimagetool/releases/download/continuous/appimagetool-x86_64.AppImage"

# Welcome message and prompt user for confirmation
echo "This setup script will create directory \"${APPIMAGES_DIR}\" in your home directory."
read -p "Type \"yes\" to proceed: " user_response
if [[ "${user_response,,}" != "yes" ]]; then
    echo "Exiting..."
    exit 1
fi

# Create the directory and change to it
mkdir -p "${HOME}/${APPIMAGES_DIR}" && cd "${HOME}/${APPIMAGES_DIR}" || { echo "Failed to create or access directory."; exit 1; }

# Download appimagetool-x86_64.AppImage
echo "Getting appimagetool-x86_64.AppImage"
wget -q "${APPIMAGETOOL_URL}" || { echo "Failed to download AppImage."; exit 1; }
chmod +x appimagetool-x86_64.AppImage

# Install zsync
echo "Installing zsync"
sudo apt-get install -y zsync || { echo "Failed to install zsync."; exit 1; }

# Success message
echo "Setup completed successfully."
