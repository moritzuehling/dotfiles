#!/bin/bash

current_workspace=$(hyprctl activeworkspace -j | jq .id)
if [ "$current_workspace" -ne "$1" ]; then
    hyprctl dispatch "workspace $1"
else
    hyprctl dispatch "changegroupactive"
fi
