systemctl --user import-environment DISPLAY

setxkbmap -option "caps:swapescape"

sxhkd &
picom --experimental-backends &
redshift &
exec bspwm
