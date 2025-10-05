create_appimage - A Bash script to simplify the creation of appimages.

How-to:
1. Place your executable application in the APP directory.
   Place your app's icon in the ICON directory.
   - If no icon matches your app's name, the appimage icon will be used.
2. Run `create_appimage.sh`

Running `create_appimage` will:
- Copy your application from `APP/your_app_name` to `your_app_name/usr/bin`.
- Copy the application icon from `APP/your_app_name` to `your_app_name/usr/bin`.
- Create your_app_name.desktop.
- Create the AppRun scipt for your app.
- Run appimagetool-x86_64.AppImage which will build an appimage named your_app_name.appimage.
- Change your_app_name.AppImage to executable.
- Offer to run your_app_name.AppImage.
