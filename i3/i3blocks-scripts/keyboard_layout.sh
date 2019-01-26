#! /bin/sh
CURRENT_LAYOUT=`setxkbmap -query | gawk '/layout:/ {print $2}'`

echo $CURRENT_LAYOUT
echo $CURRENT_LAYOUT

[ $CURRENT_LAYOUT = "us" ] && echo "#B294BB" && exit 0
[ $CURRENT_LAYOUT = "ca" ] && echo "#81A2BE"
exit 0


