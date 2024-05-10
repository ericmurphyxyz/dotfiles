#!/bin/sh

# Script to set the wallpaper
# Uses hyprpaper

# Location of the current wallpaper
WALLPAPER_LOCATION=${XDG_DATA_HOME:-$HOME/.local/share}/wall.png

# If image is passed, copy the image to wallpaper_location
if [ $# -gt 0 ]; then
	# Check if file passed is an image, return an error otherwise 
	case "$(file --mime-type -b "$1")" in
		image/* ) echo "Setting wallpaper..." && convert "$1" -resize 1920x1200^ -gravity center -extent 1920x1200^ "$WALLPAPER_LOCATION" ;;
		*) echo "Not a valid image or directory." ; exit 1;;
	esac
	fi

# restart hyprpaper
pkill hyprpaper
nohup hyprpaper >/dev/null 2>&1 &
