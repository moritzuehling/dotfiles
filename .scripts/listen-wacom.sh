#!/bin/bash

DEVICE=/dev/input/by-id/usb-Wacom_Co._Ltd._Intuos_BT_M_2EH00U2013893-event-mouse
WORKSPACE=7

evtest $DEVICE | grep --line-buffered "type 1 (EV_KEY), code 330 (BTN_TOUCH), value 1" | while read -r LINE; do echo $LINE; hyprctl dispatch workspace $WORKSPACE; done


