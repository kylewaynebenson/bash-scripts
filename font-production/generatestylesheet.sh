# Generate Stylesheets
# Created by Kyle Wayne Benson

# Notes: You will be prompted for a font family name. Make sure there are no spaces in your folder name.
# This script needs to be in a folder next to the folder filled with fonts that you're referencing.
cd ..
echo ">> What is the name of the folder/font family? Options are:"
echo 
for folder in *; do 
	echo " \t $folder"
done
read fontname
echo "/* CSS for ${fontname} generated $(date +%F) */" > $fontname/$fontname.css
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
