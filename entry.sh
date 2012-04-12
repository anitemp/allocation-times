#!/bin/bash

#name format: <#nodes>-noderuns-<time required>.psub.o<job id>

rm -f .tmp

#job id
echo $1 | egrep -o 'o[[:digit:]]+' | tr -d 'o' >> .tmp

#nodes
echo $1 | egrep -o '[[:digit:]]+-'| tr -d '-' >> .tmp

#time requested
echo $1 | cut -d'-' -f3|cut -d'.' -f1 >> .tmp

#start time
date -d "`grep start $1 | cut -d':' -f2-`" +%s >> .tmp

#stop time
date -d "`grep stop $1 | cut -d':' -f2-`" +%s >> .tmp

cat .tmp|tr -d ' '|tr '\n' ' '
echo
