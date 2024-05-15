#!/bin/bash

# Check the number of monitors
monitor_count=$(hyprctl monitors -j | jq length)

if [ "$monitor_count" -ge 2 ]; then
  # If there are 2 or more monitors, disable eDP-1 and eDP-2
  hyprctl keyword monitor eDP-1,disable
  hyprctl keyword monitor eDP-2,disable
else
  # Otherwise, set resolutions for eDP-1 and eDP-2
  hyprctl keyword monitor eDP-1,2560x1440@240,0x0,1.250
  hyprctl keyword monitor eDP-2,2560x1440@240,0x0,1.250
fi
