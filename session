#!/bin/bash

# This script is used to search for a project folder with fzf and open it in vscode directly from the terminal

# If a folder is passed as an argument, use it
if [[ $# -eq 1 ]]; then
    project_folder=$1
# Otherwise, search for a folder
else
    project_folder=$(find ~ ~/repos ~/repos/bitbull ~/repos/personal  -mindepth 1 -maxdepth 1 -type d | fzf)
fi

# If no folder is selected, exit
if [[ -z $project_folder ]]; then
    exit 0
fi

code $project_folder

