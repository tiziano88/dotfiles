#!/bin/bash

# sudo ln -s /sys/devices/platform/i8042/serio1/serio2 ~/trackpoint

echo -n 250 > /sys/devices/platform/i8042/serio1/serio2/sensitivity
#echo -n 160 > /sys/devices/platform/i8042/serio1/serio2/speed
#echo -n 1 > /sys/devices/platform/i8042/serio1/serio2/press_to_select
#echo -n 4 > /sys/devices/platform/i8042/serio1/serio2/upthresh

#synclient TouchPadOff=1

#synclient FingerHigh=30
synclient FingerHigh=99
