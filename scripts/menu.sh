#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
LINKS="$CURRENT_DIR/../links"

stay=1
path="$LINKS"

gen_cmd () {
	a=($(ls $path)) # Gets list of bookmarks
	lim=${#a[@]}
	i=0
	cmd=("NEWT_COLORS='root=,black
		border=green,black
		window=,black
		button=black,green
		actsellistbox=black,green
		listbox=green,black
		actlistbox=green,black
		textbox=green,black
		compactbutton=green,black'")

	cmd+=('whiptail'  '--menu "Select Bookmark!" 20 60 10')


	while [ $i -ne $lim ];
	do
		cmd+=("'$(($i+1))'")
		cmd+=("'${a[$i]}'")
		i=$(($i + 1))
	done

	cmd+=("3>&1 1>&2 2>&3")
}

run_cmd () {
	i=$(eval ${cmd[@]})
	i=$(($i - 1))
	cmd="$path/${a[$i]}" # Gets Selected File/Directory
}

while [ $stay -eq 1 ]; do
	gen_cmd
	run_cmd

	if [ ! -L $cmd ] && [ -d $cmd ]; then
		path="$cmd"
	else
		stay=0
	fi
done

eval "cd $(readlink -f $cmd)"
