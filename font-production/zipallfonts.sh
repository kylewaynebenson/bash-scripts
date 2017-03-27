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