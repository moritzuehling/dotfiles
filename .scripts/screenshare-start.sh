#!/usr/bin/bash

swaync-client --inhibitor-add "xdg-desktop-portal-wlr"
ln -sf $HOME/.config/hypr/screenshare-active.conf $HOME/.config/hypr/screenshare-link.conf
ln -sf $HOME/.config/waybar/screnshare.css $HOME/.config/waybar/active.css
killall -SIGUSR2 waybar

swww img "$HOME/Pictures/wallpapers/screenshare.png" --transition-step 255
