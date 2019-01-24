#! /bin/sh

CURRENT_LAYOUT=`setxkbmap -query | gawk '/layout:/ {print $2}'`

if [ $CURRENT_LAYOUT = "us" ]; then
    setxkbmap ca
elif [ $CURRENT_LAYOUT = "ca" ]; then
    setxkbmap us
fi

pkill -SIGRTMIN+10 i3blocks
