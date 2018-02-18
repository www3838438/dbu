#!/bin/bash
source ~/.conky/scripts.conf
cat "$textfile" |tr "\n" " "   | cut -f 1 -d '#' | fold -w 60