#!/bin/bash

set -e
mkdir -p /tmp/gitbutler
# wget https://app.gitbutler.com/downloads/release/linux/x86_64/gz -O /tmp/gitbutler/version.tar.gz

cd /tmp/gitbutler
tar -xf version.tar.gz

mv GitButler_*.AppImage GitButler
cp GitButler ~/.local/bin/

# ./GitButler --appimage-extract

mkdir -p ~/.local/gitbutler
cp ./squashfs-root/gitbutler-tauri.png ~/.local/gitbutler/icon.png

cat >~/.local/share/applications/GitButler.desktop <<EOL
[Desktop Entry]
Type=Application
Name=GitButler
Exec=/home/$USER/.local/bin/GitButler
Icon=/home/$USER/.local/gitbutler/icon.png
Categories=Development;
StartupWMClass=gitbutler-tauri
Terminal=false
EOL

chmod +x ~/.local/share/applications/GitButler.desktop
update-desktop-database ~/.local/share/applications
#cd ~
#rm -r /tmp/gitbutler
