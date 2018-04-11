#!/bin/bash
# Description: formats and displays a text file in conky

source ~/.conky/scripts.conf
cat "$textfile" |tr "\n" " "   | cut -f 1 -d '#' | fold -w 60