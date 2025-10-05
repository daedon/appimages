#!/usr/bin/env bash
if [[ $# -ne 0 ]]; then
   cat README.md
   exit 1
fi

# Get ${APPIMAGES_DIR} as set by install.sh
source config.sh
echo APPIMAGES_DIR is ${APPIMAGES_DIR}

cd ${APPIMAGES_DIR}/APP
files_in_APP=$(find . -maxdepth 1 -type f -iname "*" | wc -l)
if [[ ${files_in_APP} -ne 1 ]]; then
   echo "ERROR: Expected one file in APP directory, found ${files_in_APP} files."
   ls -1
   cat README.md
   exit 1
fi

app_name=`ls -1 * | head -1`
echo App anme is ${app_name}

cd ${APPIMAGES_DIR}
mkdir -p ${app_name}/usr/bin
cp APP/${app_name} ${app_name}/usr/bin
chmod +x ${app_name}/usr/bin/${app_name}

echo "#!/bin/bash"                         >${app_name}/AppRun
echo "${app_name}/usr/bin/${app_name}"    >>${app_name}/AppRun
chmod +x ${app_name}/AppRun

echo "[Desktop Entry]"       >${app_name}/${app_name}.desktop
echo "Type=Application"     >>${app_name}/${app_name}.desktop
echo "Name=${app_name}"     >>${app_name}/${app_name}.desktop
echo "Exec=${app_name}"     >>${app_name}/${app_name}.desktop
echo "Icon=${app_name}"     >>${app_name}/${app_name}.desktop
echo "Categories=Utility;" >>${app_name}/${app_name}.desktop

if [[ -f ICONS/${app_name}.png ]]; then
   cp ICONS/${app_name}.png ${app_name}
else
   cp ICONS/appimage_icon.png ${app_name}/${app_name}.png
fi

ARCH=x86_64 ./appimagetool-x86_64.AppImage ${app_name} ${app_name}.AppImage
echo ======================================================================
read -p "Press enter to launch \"${app_name}.AppImage\" "
./${app_name}.AppImage
