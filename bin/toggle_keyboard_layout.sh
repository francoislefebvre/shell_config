#! /bin/sh

CURRENT_LAYOUT=`setxkbmap -query | gawk '/layout:/ {split($2,layouts,","); print layouts[1]}'`

if [ $CURRENT_LAYOUT = "us" ]; then
    setxkbmap ca
elif [ $CURRENT_LAYOUT = "ca" ]; then
    setxkbmap us
fi

pkill -SIGRTMIN+10 i3blocks
