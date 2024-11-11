#!/bin/bash

# This script is used to search for a particular file with fzf and open it in vscode directly from the terminal

# Search for a file, exluding the ones in some folders
file=$(find ~/repos/ -type f -not -path "*/node_modules/*" -not -path "*/.nuxt/*" -not -path "*/dist/*" -not -path "*/vendor/*" -not -path "*/.git/*" | fzf)

# If no file is selected, exit
if [[ -z $file ]]; then
    exit 0
fi

code --reuse-window $file

