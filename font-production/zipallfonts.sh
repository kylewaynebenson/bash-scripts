# Zip All Fonts
# Created by Kyle Wayne Benson

# Notes: edit the fontname variable on line 8 to be your folder name. Make sure there are no spaces in your folder name.
# This script needs to be in a directory named docs next to the folder filled with fonts that you're referencing.

cd ..

fontname=MaritimeChampion

for FILE in $fontname/*.otf
	do FONT=${FILE##*/}
	DIR=${FILE%/*}
	zip ${FILE%.*}.zip $FILE ${DIR}/verycoollicense.pdf
done

cd $fontname
mkdir ${fontname}-complete
cd ..

for FILE in $fontname/{*.otf,*.pdf}
	do FONT=${FILE##*/}
	DIR=${FILE%/*}
	ditto $FILE ${DIR}/${fontname}-complete/$FONT
done

cd $fontname
zip -r ${fontname}-Complete.zip ${fontname}-complete
rm -r ${fontname}-complete

cd ..
cd docs
