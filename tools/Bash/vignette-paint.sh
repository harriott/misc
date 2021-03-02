#!/bin/bash

# Joseph Harriott  Tue 02 Mar 2021
#  developed from Fred Weinhaus'  vignette2.sh
#   $IT1/UnixLike/GNU+Linux/ImageMagick/VIGNETTE2/vignette2.sh

# parameters:
#  ellipse horizontal offset % from -50 to 50
#  ellipse vertical offset % from -50 to 50
#  ellipse width % from 1 & 50
#  ellipse height % from 1 & 50
#  infile
#  outfile

# setup temp files
tmpA1="./vp_1_$$.mpc"
tmpB1="./vp_1_$$.cache"
trap "rm -f $tmpA1 $tmpB1;" 0
trap "rm -f $tmpA1 $tmpB1; exit 1" 1 2 3 15
trap "rm -f $tmpA1 $tmpB1; exit 1" ERR

# test input image
convert -quiet "$5" +repage "$tmpA1" ||
	errMsg "$5 does not exist, is not an ordinary file, is not readable, or has zero size"

# image dimensions
ww=`identify -ping -format "%w" $tmpA1`
hh=`identify -ping -format "%h" $tmpA1`

# ellipse coordinates
centreX=$((ww/2+ww*$1/100))
centreY=$((hh/2+hh*$2/100))
ellipsew=$((ww*$3/100))
ellipseh=$((hh*$4/100))

# prepare the oil-painting effect
convert $tmpA1 -paint 11 painting.jpg

# make the mask shape
convert $tmpA1 -fill white -colorize 100% -fill black -draw "translate $centreX,$centreY ellipse 0,0 $ellipsew,$ellipseh 0,360" -blur 0x25 shape.jpg

# compose the vignetted image
composeMethod=src
convert $tmpA1 painting.jpg shape.jpg -compose $composeMethod -composite $6

echo "- don't forget to delete painting.jpg & shape.jpg"
exit 0
