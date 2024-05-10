#!/bin/sh

# Use brightnessctl to naturally adjust laptop screen brightness and send a notification

currentbrightness=$(brightnessctl -e4 -m | awk -F, '{print substr($4, 0, length($4)-1)}')
if [ "$currentbrightness" -lt 30 ] && [ "$1" = "down" ]; then exit 1; fi

send_notification() {
	brightness=$(brightnessctl -e4 -m | awk -F, '{print substr($4, 0, length($4)-1)}')
	dunstify -a "Backlight" -u low -r 9994 -h int:value:"$brightness" -i "brightness" "Brightness" "Currently at $brightness%" -t 1000
}

case $1 in
	up)
		brightnessctl -e4 set 5%+
		send_notification "$1"
		;;
	down)
		brightnessctl -e4 set 5%-
		send_notification "$1"
		;;
esac
