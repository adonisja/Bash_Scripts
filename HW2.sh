#!/bin/bash

read -p "Enter a filename: " filename

if [ -e $filename ]; then
    echo "$filename exists"
else
    echo "$filename does not exist"
    read -p "Would you like to create it? [yes/y or no/n]: " ans
    if [ "$ans" == "yes" ] || [ "$ans" == "y" ]; then
        touch "$filename"
        echo "$filename has been created in $(pwd)"
    else
        echo "OK, terminating process"
    fi
fi