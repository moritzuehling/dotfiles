#!/usr/bin/bash

swaync-client --inhibitor-remove "xdg-desktop-portal-wlr"
ln -sf $HOME/.config/hypr/screenshare-inactive.conf $HOME/.config/hypr/screenshare-link.conf
ln -sf $HOME/.config/waybar/no-screenshare.css $HOME/.config/waybar/active.css
killall -SIGUSR2 waybar

swww img "$HOME/Pictures/wallpapers/1.png" --transition-step 255
