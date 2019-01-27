#! /bin/sh
CURRENT_LAYOUT=`setxkbmap -query | gawk '/layout:/ {split($2,layouts,","); print layouts[1]}'`

echo $CURRENT_LAYOUT
echo $CURRENT_LAYOUT

[ $CURRENT_LAYOUT = "us" ] && echo "#ff615a" && exit 0
[ $CURRENT_LAYOUT = "ca" ] && echo "#5da9f6"
exit 0


