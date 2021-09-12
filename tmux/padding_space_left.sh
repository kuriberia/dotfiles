#!/bin/sh
path=$1
replace=${path/\/storage\/users\/tatsuki.kurihara/\~}
count=${#replace}
if [ $count -lt 14 ]; then
    num=$((14 - $count))
    space=`printf "%${num}s"`
    echo "$replace$space"
else
    echo "$replace"
fi
