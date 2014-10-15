#!/bin/bash
# iPhone Spotlight iOS5,6 Settings iOS and iPad 5-7 29pt
# iPhone Spotlight iOS7 40pt
# iPhone App iOS 5,6 57pt
# iPhone App iOS 7 60pt
# iPad Spotlight iOS 7 40pt
# iPad Spotlight iOS 5,6 50pt
# iPad App iOS 5,6 72pt
# iPad App iOS 7  76pt
# iTunes Artwork 512 1024

if [[ -z "$1" ]] 
then
	echo "Source PNG image file needed."
	exit;
fi

BASE=`basename "$1" .png`
PNG="$1"

function resize {
	SIZE1=$1
	SIZE2=`echo "$SIZE1 * 2" | bc`
	sips -Z $SIZE1 $PNG --out "$BASE-$SIZE1.png" 
	sips -Z $SIZE2 $PNG --out "$BASE-$SIZE1@2x.png"
}


for i in 29 40 50 57 60 72 76 512 
do
	resize $i
done

