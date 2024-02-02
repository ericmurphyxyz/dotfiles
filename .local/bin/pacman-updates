#!/bin/sh

# Script for use in waybar to display # of pacman updates

OUTPUT="$(checkupdates)"

if [ -z "$OUTPUT" ]; then
	exit 0
else
	NUMBER="$(echo "$OUTPUT" | wc -l)"
	TEXT="󰏔"

	TOOLTIP="$NUMBER updates found"

	echo "{\"text\":\"""$TEXT""\", \"tooltip\":\"""$TOOLTIP""\"}"
	exit 0
fi
