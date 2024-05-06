#!/bin/bash

prefixes="
https://www.thenorthface.co.uk
https://www.thenorthface.ie
https://www.thenorthface.se/en_se
https://www.thenorthface.eu/en_lu
https://www.thenorthface.eu/en_fi
https://www.thenorthface.eu/en_dk
https://www.thenorthface.de
https://www.thenorthface.at
https://www.thenorthface.ch/de_ch
https://www.thenorthface.eu/de_lu
https://www.thenorthface.fr
https://www.thenorthface.ch/fr_ch
https://www.thenorthface.eu/fr_be
https://www.thenorthface.es
https://www.thenorthface.it
https://www.thenorthface.ch/it_ch
https://www.thenorthface.nl
https://www.thenorthface.eu/nl_be
https://www.thenorthface.pl
https://www.thenorthface.pt
https://www.thenorthface.cz
https://www.thenorthface.se
https://www.thenorthface.eu/sv_fi
https://www.thenorthface.eu/da_dk
"

urllist="
backpack-finder.html
footwear-finder.html
jacket-finder.html
tent-sleepingbag-guide.html
"

# empty the files urls.txt and metadata.txt
> urls.txt
> metadata.txt

for prefix in $prefixes; do
	for url in $urllist; do
		echo "$prefix/$url" >> urls.txt
	done
done

# Extract meta title and description from all urls in the file urls.txt

while read url; do
	title=$(curl -s $url | grep -oE "<title>.*</title>" | sed 's/<title>//' | sed 's/<\/title>//')
	description=$(curl -s $url | grep -oE "<meta name=\"description\" content=\".*\"/>" | sed 's/<meta name="description" content="//' | sed 's/"\/>//')
	echo "URL: $url" >> metadata.txt
	echo "Title: $title" >> metadata.txt
	echo "Description: $description" >> metadata.txt
	echo "-----------------------------------" >> metadata.txt
done < urls.txt