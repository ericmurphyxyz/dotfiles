#!/bin/sh

# Send a notification if the laptop battery is either low or is fully charged.
# Set on a systemd timer (~/.config/systemd/user/battery-alert.timer).

export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"

# Battery percentage at which to notify
WARNING_LEVEL=20
CRITICAL_LEVEL=5
BATTERY_DISCHARGING=$(acpi -b | grep "Battery 0" | grep -c "Discharging")
BATTERY_LEVEL=$(acpi -b | grep "Battery 0" | grep -P -o '[0-9]+(?=%)')

# Use files to store whether we've shown a notification or not (to prevent multiple notifications)
FULL_FILE=/tmp/batteryfull
EMPTY_FILE=/tmp/batteryempty
CRITICAL_FILE=/tmp/batterycritical

# Reset notifications if the computer is charging/discharging
if [ "$BATTERY_DISCHARGING" -eq 1 ] && [ -f $FULL_FILE ]; then
	rm $FULL_FILE
elif [ "$BATTERY_DISCHARGING" -eq 0 ] && [ -f $EMPTY_FILE ]; then
	rm $EMPTY_FILE
fi

# If the battery is charging and is full (and has not shown notification yet)
if [ "$BATTERY_LEVEL" -gt 99 ] && [ "$BATTERY_DISCHARGING" -eq 0 ] && [ ! -f $FULL_FILE ]; then
	notify-send "Battery Charged" "Battery is fully charged." -i "battery" -r 9991
	touch $FULL_FILE
	# If the battery is low and is not charging (and has not shown notification yet)
elif [ "$BATTERY_LEVEL" -le $WARNING_LEVEL ] && [ "$BATTERY_DISCHARGING" -eq 1 ] && [ ! -f $EMPTY_FILE ]; then
	notify-send "Low Battery" "${BATTERY_LEVEL}% of battery remaining." -u critical -i "battery-alert" -r 9991
	touch $EMPTY_FILE
	# If the battery is critical and is not charging (and has not shown notification yet)
elif [ "$BATTERY_LEVEL" -le $CRITICAL_LEVEL ] && [ "$BATTERY_DISCHARGING" -eq 1 ] && [ ! -f $CRITICAL_FILE ]; then
	notify-send "Battery Critical" "The computer will shutdown soon." -u critical -i "battery-alert" -r 9991
	touch $CRITICAL_FILE
	fi
