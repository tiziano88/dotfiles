#!/usr/bin/env bash

#xinput set-int-prop "Logitech USB Trackball" "Evdev Wheel Emulation Button" 8 8
#xinput set-int-prop "Logitech USB Trackball" "Evdev Wheel Emulation" 8 1
#xinput set-prop "Logitech USB Trackball" "Evdev Wheel Emulation Axes" 6 7 4 5
#xinput set-ptr-feedback "Logitech USB Trackball" 0 100 30

#xinput set-button-map "Kingsis Peripherals  Evoluent VerticalMouse 3 0" 1 2 3 0 0

export LANG='en_GB.UTF-8'
export LC_ALL='en_GB.UTF-8'
export LANGUAGE='en_GB.UTF-8'
export LC_CTYPE='en_GB.UTF-8'

setxkbmap -v gb
setxkbmap -option 'caps:escape'
#xautolock -secure -time 10 -locker 'gnome-screensaver-command -l' -notify 15 -notifier "notify-send -t 5000 -i dialog-password -u low 'Security advisory' '\nLocking session in 15 seconds'" &

ibus exit
# ibus-daemon &

#envfile="${HOME}/.gnupg/gpg-agent.env"
#if test -f "$envfile" && kill -0 $(grep GPG_AGENT_INFO "$envfile" | cut -d: -f 2) 2>/dev/null; then
#    eval "$(cat "$envfile")"
#else
#    eval "$(gpg-agent --daemon --write-env-file "$envfile")"
#fi
#export GPG_AGENT_INFO  # the env file does not contain the export statement

#xset fp+ /usr/local/share/fonts/X11/misc
#xset fp rehash

# from https://wiki.archlinux.org/index.php/TrackPoint
#tpset() { xinput set-prop "TPPS/2 IBM TrackPoint" "$@"; }

#tpset "Evdev Wheel Emulation" 1
#tpset "Evdev Wheel Emulation Button" 2
#tpset "Evdev Wheel Emulation Timeout" 200
#tpset "Evdev Wheel Emulation Axes" 6 7 4 5
#tpset "Device Accel Constant Deceleration" 0.5

# from
# http://www.thinkwiki.org/wiki/How_to_configure_the_TrackPoint#Configuring_other_options_.28e.g._Press_to_select.2C_Sensitivity_and_Speed.29
#echo -n 255 /sys/devices/platform/i8042/serio1/serio2/sensitivity

dbus-launch --exit-with-session xmonad
