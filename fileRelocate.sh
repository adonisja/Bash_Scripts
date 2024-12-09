#!/bin/bash

destination=$(pwd)

read -p "Enter the name of the file you want to move: " filename
origin=~/Downloads/$filename

if [[ ! -e "$origin" ]]; then
    echo "$filename does not exist in the Downloads folder.
    Please check the name or location of the file. "
    exit 1
fi

sudo mv "$origin" "$destination"