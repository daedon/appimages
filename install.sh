#!/usr/bin/env bash

# Constants
APPIMAGES_DIR=`pwd`
echo APPIMAGES_DIR=${APPIMAGES_DIR}
echo APPIMAGES_DIR=\"${APPIMAGES_DIR}\" >config.sh

APPIMAGETOOL_URL="https://github.com/AppImage/appimagetool/releases/download/continuous/appimagetool-x86_64.AppImage"

# Download appimagetool-x86_64.AppImage
echo "Getting appimagetool-x86_64"
#wget -q "${APPIMAGETOOL_URL}" || { echo "Failed to download AppImage."; exit 1; }
if wget -q "${APPIMAGETOOL_URL}"; then
   echo "Download successful."
else
   echo "Failed to download APPIMAGETOOL."
   echo "Maybe try again later."
   exit 1
fi

chmod +x appimagetool-x86_64.AppImage

# Install zsync
echo "Installing zsync"
sudo apt-get install -y zsync || { echo "Failed to install zsync."; exit 1; }

# Success message
echo "Setup completed successfully."
