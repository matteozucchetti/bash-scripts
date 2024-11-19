#!/bin/bash

# This script is used to push the current branch to the remote repository.
# Commit message is the current date.
# Be sure to run this script from the right directory!

today=$(date +"%Y-%m-%d")

git add .
git commit -m "${today}"
git push origin "$(git rev-parse --abbrev-ref HEAD)"