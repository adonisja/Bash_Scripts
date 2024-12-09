#!/bin/bash

# Prompt the user for the type of files to search for
read -p "Enter the file type you want to search for (e.g., png, txt): " name

# Define the output file
output_file="file_list.txt"

# Search for all files of the given type and save the results to the output file
sudo find . -type f -name "*.$name" > "$output_file" 2>/dev/null &

# Inform the user
echo "The list of .$name files has been compiled into $output_file"