#!/usr/bin/env bash
#xinput set-int-prop "Logitech USB Trackball" "Evdev Wheel Emulation Button" 8 8
#xinput set-int-prop "Logitech USB Trackball" "Evdev Wheel Emulation" 8 1
#xinput set-prop "Logitech USB Trackball" "Evdev Wheel Emulation Axes" 6 7 4 5
#xinput set-ptr-feedback "Logitech USB Trackball" 0 100 30

#xinput set-button-map "Kingsis Peripherals  Evoluent VerticalMouse 3 0" 1 2 3 0 0

setxkbmap -v gb
xautolock -secure -time 10 -locker "gnome-screensaver-command -l" -notify 15 -notifier "notify-send -t 5000 -i dialog-password -u low 'Security advisory' '\nLocking session in 15 seconds'" &

#envfile="${HOME}/.gnupg/gpg-agent.env"
#if test -f "$envfile" && kill -0 $(grep GPG_AGENT_INFO "$envfile" | cut -d: -f 2) 2>/dev/null; then
#    eval "$(cat "$envfile")"
#else
#    eval "$(gpg-agent --daemon --write-env-file "$envfile")"
#fi
#export GPG_AGENT_INFO  # the env file does not contain the export statement

xset fp+ /usr/local/share/fonts/X11/misc
xset fp rehash
