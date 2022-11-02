#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
LINKS="$CURRENT_DIR/../links/"

a=($(ls $LINKS)) # Gets list of bookmarks
lim=${#a[@]}
i=0
cmd=("NEWT_COLORS='root=blue,black
	border=green,black
	window=,black
	button=black,green
	sellistbox=green,black
	actsellistbox=black,green
	listbox=green,black
	actlistbox=green,black
	textbox=green,black
	compactbutton=green,black'")

# root : Background
# border : Border
# window : Window
# textbox : Text
# actsellistbox : List Selected
# actlistbox : List Unselected
# button : Button selected
# compactbutton : Button unselected

cmd+=('whiptail'  '--menu "Select Bookmark!" 20 60 10')


while [ $i -ne $lim ];
do
	cmd+=("'$(($i+1))'")
	cmd+=("'${a[$i]}'")
	i=$(($i + 1))
done

cmd+=("3>&1 1>&2 2>&3")

i=$(eval ${cmd[@]})
i=$(($i - 1))
eval "cd $(readlink -f $LINKS${a[$i]})"
