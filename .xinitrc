#!/bin/sh

systemctl --user import-environment DISPLAY

sxhkd &
picom --experimental-backends &
redshift &
mpd &
mpDris2 &
xmousepasteblock &
exec bspwm
