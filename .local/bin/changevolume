#!/bin/sh

# Increment, decrement, or mute the volume and send a notification
# of the current volume level.

send_notification() {
	volume=$(pamixer --get-volume)
	dunstify -a "changevolume" -u low -r 9993 -h int:value:"$volume" -i "volume" "Volume" "Currently at ${volume}%" -t 2000
}

case $1 in
up)
	# Set the volume on (if it was muted)
	pamixer -u
	pamixer -i 5 --allow-boost
	send_notification "$1"
	;;
down)
	pamixer -u
	pamixer -d 5 --allow-boost
	send_notification "$1"
	;;
mute)
	pamixer -t
	if eval "$(pamixer --get-mute)"; then
		dunstify -a "changevolume" -t 2000 -r 9993 -u low -i "volume-mute" "Volume" "Currently muted"
	else
		send_notification up
	fi
	;;
esac
