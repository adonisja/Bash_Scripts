#!/bin/bash
echo "Enter directory you wish to organize: "
read dir
if [ -d "$dir" ]; then
    for file in "$dir"/*; do
        ext="${file##*.}"
        if [ -f "$file" ]; then
            mkdir -p "$dir/$ext"
            mv "$file" "$dir/$ext/"
        fi
    done
    echo "Files Organized by Extention"
else: 
    echo "Directory does not exist"
fi