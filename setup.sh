#!/usr/bin/env bash
#250929-1235
clear
appimages_dir="appimages"
echo This setup script will create directory \"${appimages_dir}\" in your home directory
read -p "Type \"yes\" to procede: " user_response
if [ "${user_response}x" != "yesx" ]; then
   exit
fi

cd
echo mkdir -p "${appimages_dir}"
set -x
mkdir -p "${appimages_dir}"
exit

cd ${appimages_dir}
echo Getting appimagetool-x86_64.AppImage
wget https://github.com/AppImage/appimagetool/releases/download/continuous/appimagetool-x86_64.AppImage
echo chmod +x appimagetool-x86_64.AppImage
echo Installing zsync
sudo apt-get install zsync


#app_dir="${appimages_dir}/APP"
