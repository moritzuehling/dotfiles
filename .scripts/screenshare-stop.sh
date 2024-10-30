#!/usr/bin/bash

swaync-client --inhibitor-remove "xdg-desktop-portal-wlr"
ln -sf $HOME/.config/hypr/screenshare-inactive.conf $HOME/.config/hypr/screenshare-link.conf
ln -sf $HOME/.config/waybar/no-screenshare.css $HOME/.config/waybar/active.css

touch -m $HOME/.config/waybar/style.css

swww img "$HOME/Pictures/wallpapers/frieren2.jpg" --transition-step 255
