#!/bin/bash
# This script merges a subdirectory into it's parent directory

# Prompt user for input
read -p "Enter the PATH of the subdirectory you want to move into it's parent: " source

# Check if the subdirectory exists
if [ ! -d "$source" ]; then
    echo "Error: This subdirectory or Path does not exist!"
    exit 1
fi

# Check if the subdirectory is empty
if [ -z "$(ls -A "$source")" ]; then
    echo "Error: This subdirectory is empty"
fi

# Moves the files in the subdirectory into it's parent
mv "$source"/* .