#!/usr/bin/env bash

LINKS="./links/"

a=($(ls links)) # Gets list of bookmarks
lim=${#a[@]}
i=0
cmd=('whiptail' '--title "Hello THere!"' '--menu Hello 20 60 10')


while [ $i -ne $lim ];
do
	cmd+=("'$(($i+1))'")
	cmd+=("'${a[$i]}'")
	i=$(($i + 1))
done

cmd+=("3>&1 1>&2 2>&3")

#echo "${cmd[@]}"

i=$(eval ${cmd[@]})
i=$(($i - 1))
eval "cd $(readlink -f $LINKS${a[$i]})"
