#!/bin/bash

# This script is used to open the daily note markdown file in the default editor.
# If the file does not exist, create a new one.

today=$(date +"%Y-%m-%d")
file="$ZET"'/daily/'$(date +"%Y-%m-%d").md

cd "$ZET" || exit

new_note() {
	touch "$file"

	# Format the file with the daily template
	cat <<EOF >"$file"
# $today

## Tracking

- [ ] Workout
- [ ] Run / Hike
- [ ] Mobility / Stretching
- [ ] Read / Study

## Log
EOF

}

# If the daily note does not exist, create a new one.
# this uses the test command with the -f flag.
if [ ! -f "$file" ]; then
	echo "File does not exist, creating new daily note."
	new_note
fi

# Open
code -r . "$file"
