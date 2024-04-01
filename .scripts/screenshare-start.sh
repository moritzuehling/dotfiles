#!/usr/bin/bash

swaync-client --inhibitor-add "xdg-desktop-portal-wlr"
ln -sf $HOME/.config/hypr/screenshare-active.conf $HOME/.config/hypr/screenshare-link.conf
ln -sf $HOME/.config/waybar/screnshare.css $HOME/.config/waybar/active.css
touch -m $HOME/.config/waybar/style.css

swww img "$HOME/Pictures/wallpapers/screenshare.png" --transition-step 255
