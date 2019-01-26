#! /bin/sh
CURRENT_LAYOUT=`setxkbmap -query | gawk '/layout:/ {split($2,layouts,","); print layouts[1]}'`

echo $CURRENT_LAYOUT
echo $CURRENT_LAYOUT

[ $CURRENT_LAYOUT = "us" ] && echo "#B294BB" && exit 0
[ $CURRENT_LAYOUT = "ca" ] && echo "#81A2BE"
exit 0


