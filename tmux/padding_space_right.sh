#!/bin/sh
path=$1
replace=${path/\/storage\/users\/tatsuki.kurihara/\~}
count=${#replace}
if [ $count -gt 13 ]; then
    num=$(($count - 13))
    space=`printf "%${num}s"`
    echo "$space"
else
    echo ""
fi
