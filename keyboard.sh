#!/bin/sh

# This only implements static colors.
# If you want to implement spectrum cycling or
# blinking, you have the necessary informations below.
# I personally dislike non-static lighting.
# 1:cmd - 1 (?)
# 2:mode - 0=static, 1=blinking, 2=cycling
# 3:red, 4:green, 5:blue = 0-255
# 6:speed = 0-2
# writing anything non-numeric will give you an error.
# writing more or less than 6 arguments to the file
# will also give you an error
# Have fun.

bpath=/sys/class/leds/asus::kbd_backlight/kbd_rgb_mode

PrintHelp() {
    echo "usage: keyboard.sh <1 or 3 arguments>"
    echo "1 argument = color (can be shortened to the initial)"
    echo "white, red, green, blue, cyan, yellow, magenta, off"
    echo "3 arguments = rgb value (0-255)"
    exit
}

if [[ $# -eq 1 ]]; then
    if [[ $1 =~ ^(white|w)$ ]]; then
        echo "1 0 255 255 255 0" > $bpath
        exit
    elif [[ $1 =~ ^(r|red)$ ]]; then
        echo "1 0 255 0 0 0" > $bpath
        exit
    elif [[ $1 =~ ^(g|green)$ ]]; then
        echo "1 0 0 255 0 0" > $bpath
        exit
    elif [[ $1 =~ ^(b|blue)$ ]]; then
        echo "1 0 0 0 255 0" > $bpath
        exit
    elif [[ $1 =~ ^(c|cyan)$ ]]; then
        echo "1 0 0 255 255 0" > $bpath
        exit
    elif [[ $1 =~ ^(y|yellow)$ ]]; then
        echo "1 0 255 255 0 0" > $bpath
        exit
    elif [[ $1 =~ ^(m|magenta)$ ]]; then
        echo "1 0 255 0 255 0" > $bpath
        exit
    elif [[ $1 =~ ^(b|black|o|off)$ ]]; then
        echo "1 0 0 0 0 0" > $bpath
        exit
    fi
elif [[ $# -eq 3 ]]; then
    echo "1 0 $1 $2 $3 0" > $bpath
    exit
else
    PrintHelp
fi
