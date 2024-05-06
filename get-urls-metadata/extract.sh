#!/bin/bash

prefixes="
... list of domain prefixes here
"

urllist="
... list of slugs here
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