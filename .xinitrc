systemctl --user import-environment DISPLAY

sxhkd &
picom --experimental-backends &
exec bspwm
