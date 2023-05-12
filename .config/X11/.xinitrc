#!/bin/sh
# Startup script but everything important is in bspwmrc

systemctl --user import-environment DISPLAY
exec bspwm
