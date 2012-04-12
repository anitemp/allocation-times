#!/bin/bash

cat header > table

find . -name '*.o*' > all

cat all | xargs grep -i error |cut -d':' -f1|uniq > auto_error

cat manual_error auto_error > error

cat all | jtset -d error > no_error


cat no_error | xargs -I{} ./entry.sh {} >> table
