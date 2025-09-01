#!/bin/bash

# Path to save the full screenshot
screenshot_path="/tmp/last-screenshot.png"

# Take a full screenshot with grim
grim "$screenshot_path"

# Use slurp to select a region; the selected region is saved in a variable
region=$(slurp -d)

# Check if a region was selected
if [ -n "$region" ]; then
    # Reformat the region output from "x,y wXh" to "wXh+x+y" format required by ImageMagick
    formatted_region=$(echo $region | awk -F '[ ,x]' '{print $3"x"$4"+"$1"+"$2}')

    # Cut the selected region from the screenshot and copy it to the clipboard
    convert "$screenshot_path" -crop "$formatted_region" png:- | wl-copy -t image/png
else
    echo "No region selected, exiting."
fi

rm "$screenshot_path"
