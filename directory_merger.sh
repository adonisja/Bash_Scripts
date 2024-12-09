#!/bin/bash

# Function to select a directory from multiple matches
select_directory() {
    local prompt=$1
    local dir_name=$2
    local dir_paths=($(find / -type d -name "$dir_name" 2>/dev/null))
    
    if [ ${#dir_paths[@]} -eq 0 ]; then
        echo "Directory '$dir_name' not found."
        exit 1
    elif [ ${#dir_paths[@]} -eq 1 ]; then
        echo "${dir_paths[0]}"
    else
        echo "$prompt"
        select dir_path in "${dir_paths[@]}"; do
            if [ -n "$dir_path" ]; then
                echo "$dir_path"
                break
            else
                echo "Invalid selection. Please try again."
            fi
        done
    fi
}

#Accepts user input for the source directory
read -p "Enter the directory you wish to merge: " source

# Locates and outputs the path to the source directory
source_path=$(select_directory "Select the source directory:" "$source")
echo "The path to $source is: $source_path"

#Repeat for Destination directory
read -p "What is the directory to merge into: " destination
destination_path=$(select_directory "Select the destination directory:" "$destination")
echo "The path to $destination is: $destination_path"

# Merge Directories
#echo "Merging $source_path into $destination_path..."
#rsync -av --progress "$source_path/" "$destination_path/"
#echo "Merge Completed, Congrats!"