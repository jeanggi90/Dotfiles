#!/bin/bash
# Monitor controller

penMap() {
    xinput --map-to-output 'Wacom Pen and multitouch sensor Finger touch' eDP-1
    xinput --map-to-output 'Wacom Pen and multitouch sensor Pen stylus' eDP-1
    xinput --map-to-output 'Wacom Pen and multitouch sensor Pen eraser' eDP-1
}

usage() {
    echo "Usage: $0 \n
        -h help\n
        -s built-in monitor only\n
        -e external monitor only\n
        -m multi monitor\n
        -c clone monitor" 1>&2; exit 1;
}

# No flags passed
if [[ $# -eq 0 ]]
then
   usage
fi

# Flags passed
while getopts 'hsmec' flag
do
    case "${flag}" in
        s)
            # Single monitor built-in
            xrandr --output eDP-1 --primary --mode 3840x2160 --pos 0x0 --rotate normal --output DP-1 --off --output HDMI-1 --off --output DP-2 --off
            penMap
            ~/.fehbg
            ;;
        e)
            # Single monitor external
            xrandr --output eDP-1 --off  --output DP-1 --off --output HDMI-1 --primary --mode 1920x1080 --scale 2.5x2.5 --rotate normal --output DP-2 --off
            penMap
            ~/.fehbg
            ;;
        m)
            # Multiple monitor
            xrandr --output eDP-1 --primary --mode 3840x2160 --pos 432x2700 --rotate normal --output DP-1 --off --output HDMI-1 --mode 1920x1080 --scale 2x2 --pos 0x0 --rotate normal --output DP-2 --off
            penMap
            ~/.fehbg
            ;;
        c)
            # Multiple monitor clone
            xrandr --output eDP-1 --primary --mode 3840x2160 --pos 432x2700 --rotate normal --output DP-1 --off --output HDMI-1 --mode 1920x1080 --scale 2x2 --pos 0x0 --rotate normal --same-as eDP-1 --output DP-2 --off
            penMap
            ~/.fehbg
            ;;
        h | *)
            usage
            ;;
    esac
done
