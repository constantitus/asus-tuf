#!/bin/sh

bpath=/sys/class/leds/asus::kbd_backlight/brightness

PrintHelp() {
    echo "usage: brightness.sh <argument>"
    echo "min = 0, max = 3"
    echo "+ or - increase/decrease value by 1"
    exit
}

val=$(cat $bpath)

if [[ $# -ne 1 ]]; then
    PrintHelp
fi

if [[ $1 =~ ^(0|1|2|3)$ ]]; then
    echo "$1" > $bpath
    exit
elif [[ $1 == "+" ]]; then
    if [[ $val -ge 3 ]]; then
        echo "Max value reached"
        exit
    fi
    echo "$(($val+1))" > $bpath
    exit
elif [[ $1 == "-" ]]; then
    if [[ $val -le 0 ]]; then
        echo "Min value reached"
        exit
    fi
    echo "$(($val-1))" > $bpath
    exit
else
    PrintHelp
fi
