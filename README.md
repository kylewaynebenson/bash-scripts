# Bash Scripts
Lil' shell scripts I've made to solve dumb problems over the years.

## Font Production
All the font production scripts assume that you're storing your font families in a folder that has the font family's name. So when you run them, make sure your folder with the fonts is named FontFamilyName (not *Font Family Name* or *notactualfontfamilyname* or *lolNickname*). It also assumes that your shell scripts are stored in a folder next to that folder named docs, and that all of your fonts are .otf files.
### Zip All Fonts
This lil dude takes and bundles each of your fonts with a nearby license.pdf file. It also bundles the whole group of fonts with a license.pdf file.
### Generate Stylesheet
This generates a css file that calls all fonts in the folder.
