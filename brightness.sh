#!/bin/sh

bpath=/sys/class/leds/asus::kbd_backlight/brightness

PrintHelp() {
    echo "usage: brightness.sh <argument>"
    echo "min = 0, max = 3"
    echo "+ or - increase/decrease value by 1"
    echo "toggle = 0 / 3"
    exit
}

val=$(cat $bpath)

if [[ $# -ne 1 ]]; then
    PrintHelp
fi

case "$1" in
    0|1|2|3)
        echo "$1" > $bpath
        exit ;;
    t|toggle)
        if [[ $val -gt 0 ]]; then
            echo "0" > $bpath
        else
            echo "3" > $bpath
        fi
        exit ;;
    +)
        if [[ $val -ge 3 ]]; then
            echo "Max value reached"
            exit
        fi
        echo "$(($val+1))" > $bpath
        exit ;;
    -)
        if [[ $val -le 0 ]]; then
            echo "Min value reached"
            exit
        fi
        echo "$(($val-1))" > $bpath
        exit ;;
    *)
        PrintHelp
esac
