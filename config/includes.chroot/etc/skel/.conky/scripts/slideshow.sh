#!/bin/bash
 
##########################################################################
##               conky slideshow by Alessandro Roncone                  ##
##                               v 0.2                                  ##
##                          GNU GPLv3 2012                              ##
##########################################################################
 
##########################################################################
# Settings
##########################################################################
source ~/.conky/scripts.conf


# Directory containing the script and the pictures
directory="$IMAGESDIR"
# Dimension of the slideshow (either "small", "medium" or "big")
dim="big"
 
##########################################################################
# Script (do not change unless you know what you're doing)
##########################################################################

# Manage dimension flag
if [ $dim == "small" ]; then
  geometry="158x100"
  pos="155,214"
elif [ $dim == "medium" ]; then
  geometry="238x148"
  pos="85,175"
elif [ $dim == "big" ]; then
  geometry="318x200"
  pos="0,119"
fi
 
# Pick a random file from all pictures
files=($directory/*.*)
let r="$RANDOM % ${#files[*]}"
randomfile=${files[$r]}
 
# Sets picture for conky to use
convert $randomfile -resize $geometry\> -size $geometry xc:black +swap -gravity center  -composite ~/.conky/images/current.png
convert ~/.conky/images/photobg_bg_$dim.png ~/.conky/images/current.png -geometry +11+11 -composite ~/.conky/images/result.png
convert ~/.conky/images/result.png ~/.conky/images/photobg_shadow_$dim.png -composite ~/.conky/images/result.png
echo "\${image ~/.conky/images/result.png -p $pos}"
exit
