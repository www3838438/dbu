#!/bin/bash
#quodlibet info script
TITLE=$(grep 'title=' ~/.quodlibet/current | cut -d"=" -f 1 --complement )
ALBUM=$(grep 'album=' ~/.quodlibet/current | cut -d"=" -f 1 --complement )
ARTIST=$(grep 'artist=' ~/.quodlibet/current | cut -d"=" -f 1 --complement )
#fontname="WeblySleek UI"
fontname="Droid Sans"
echo -e "\${goto 120}\${color white}\${font $fontname:pixelsize=25}$ARTIST - $TITLE\${font $fontname:pixelsize=18}\n\${goto 120}$ALBUM\${font}	"
