# Generate Stylesheets
# Created by Kyle Wayne Benson

# Notes: edit the fontname variable on line 11 to be your folder name. Make sure there are no spaces in your folder name.
# This script needs to be in a directory named docs next to the folder filled with fonts that you're referencing.
# Edit the array on line 12 so that your font style variables align with the weight classes you want.

fontname=MaritimeChampion
rm $fontname/$fontname.css
echo "/* CSS for ${fontname} generated $(date +%F) */" >> $fontname/$fontname.css
echo "/* CSS Generator made by Kyle Wayne Benson */" >> $fontname/$fontname.css
ARRAY=( "100:Thin"
        "200:Extralight"
        "200:ExtraLight"
        "300:Light"
        "400:Regular"
        "500:Medium"
        "600:SemiBold"
        "600:Semibold"
        "700:Bold"
        "800:ExtraBold"
        "900:Black" )
cd ..

for FILE in $fontname/*.otf
	do FONT=${FILE##*/}
	FONTNAME=${FONT%.*}
	DIR=${FILE%/*}
	STYLE=${FONTNAME##*-}
	FAMILY=${FONT%-*}
	family=`echo "$fontname" | tr '[:upper:]' '[:lower:]'` 

	for WEIGHT in "${ARRAY[@]}" ; do
	    KEY="${WEIGHT%%:*}"
	    VALUE="${WEIGHT##*:}"
	    if [ "$VALUE" == "$STYLE" ]
	    	then FONTWEIGHT=${KEY}
	    fi
	done

	echo "@font-face {
	font-family: '${FAMILY}';
	font-weight: '${FONTWEIGHT}';
	src: url('../type/${family}/${FONTNAME}.eot'); /* IE9 */
	src: url('../type/${family}/${FONTNAME}.eot?#iefix') format('embedded-opentype'), /* IE6-IE8 */
		url('../type/${family}/${FONTNAME}.woff2') format('woff2'),
		url('../type/${family}/${FONTNAME}.woff') format('woff');
}" >> ${DIR}/$fontname.css
done

cd docs
