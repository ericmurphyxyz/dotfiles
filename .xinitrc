systemctl --user import-environment DISPLAY

sxhkd &
picom &
exec bspwm
