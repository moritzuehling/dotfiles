#!/bin/bash

DEVICE=/dev/input/by-id/usb-Wacom_Co._Ltd._Intuos_BT_M_2EH00U2013893-event-mouse

evtest $DEVICE |\
	grep --line-buffered "type 1 (EV_KEY), code 330 (BTN_TOUCH), value 1" |\
	while read -r LINE; do \
	echo $LINE;\
	WORKSPACE=$(hyprctl clients -j | jq '.[] | select(.class=="com.github.xournalpp.xournalpp") | .workspace.id');\
	echo $WORKSPACE;\
	hyprctl dispatch workspace $WORKSPACE;
	FOCUS=$(hyprctl clients -j | jq '.[] | select(.class=="com.github.xournalpp.xournalpp") | .focusHistoryID');\
	if [ $FOCUS -ne 0 ]; then\
		hyprctl dispatch focuswindow class:com.github.xournalpp.xournalpp;\
		echo "focused";\
	fi
done

# hyprctl clients -j | jq '.[] | select(.class=="com.github.xournalpp.xournalpp") |
# 	hyprctl dispatch focuswindow class:com.github.xournalpp.xournalpp;\



