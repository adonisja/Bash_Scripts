#!/bin/bash

# Define the base directory to scan
read -p "Enter the PATH to the directory you want to sort: " base_directory
#base_directory="/path/to/your/directory"

# Function to recursively sort files
sort_files() {
  local current_directory="$1"

  # Loop through each file in the current directory and its subdirectories
  find "$current_directory" -type f | while read -r file; do
    # Extract the file extension
    extension="${file##*.}"

    # Define folder categories based on file extensions
    case "$extension" in
      # Image files
      png|jpg|jpeg|heic|gif)
        folder="Images"
        ;;
      
      # Word processing files
      txt|doc|docx|pdf|rtf)
        folder="Documents"
        ;;
      
      # Spreadsheet files
      xls|xlsx|csv)
        folder="Spreadsheets"
        ;;
      
      # Presentation files
      ppt|pptx|key)
        folder="Presentations"
        ;;
      
      # Code files
      py|js|html|css|cpp|java)
        folder="Code"
        ;;
      
      # Default case if no match
      *)
        folder="Others"
        ;;
    esac

    # Get the parent directory of the file
    parent_directory=$(dirname "$file")
    
    # Create the subdirectory (Images, Documents, etc.) within the parent directory
    mkdir -p "$parent_directory/$folder"
    
    # Move the file into the respective subdirectory within its parent
    mv "$file" "$parent_directory/$folder/"
  done
}

# Call the function to sort files recursively from the base directory
sort_files "$base_directory"
