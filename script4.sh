#!/bin/bash
 
read -p "Enter directory to backup: " dir

if [ -d "$dir" ]; then
    mkdir -p ~/backup  
    size=$(du -sk ~/"$dir" | cut -f1) 
    echo "Directory size is: $size"
    if [ "$size" -gt 350 ]; then
        echo "Warning: The directory is larger that 350 Kb. Proceeding with Backup"
    else
        echo "Backing up directory"
    fi
    
    tar -czf ~/backup/"$(basename $dir)_$(date +%Y%m%d).tar.gz" "$dir"
    echo "Backup created and saved in ~/backup"
else 
    echo "Directory does not exist"
fi