#!/usr/bin/env bash
xinput set-int-prop "Logitech USB Trackball" "Evdev Wheel Emulation Button" 8 8
xinput set-int-prop "Logitech USB Trackball" "Evdev Wheel Emulation" 8 1
xinput set-prop "Logitech USB Trackball" "Evdev Wheel Emulation Axes" 6 7 4 5
xinput set-ptr-feedback "Logitech USB Trackball" 0 100 30
setxkbmap gb
eval $(gpg-agent --daemon)
