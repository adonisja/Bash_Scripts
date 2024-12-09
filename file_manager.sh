#!/bin/bash
#path=~/Documents/ClassAssignments/CS265/scripts/

create_file() {
    local name="$1"
    if [ -z "$name" ]; then
        echo "You forgot to provide a name"
        exit 1
    fi
    touch "$name" && echo "$name was created."
}

delete_file(){
    local name="$1"
    if [ -z "$name" ]; then
        echo "Mind-reading is not my forté, what file you want to delete? Please provide a name!"
        exit 1
    fi
    if [ -e "$name" ]; then
        rm "$name" && echo "$name was deleted!"
    else
        echo "$name does not exist"
        exit 1
    fi
}

file_size(){
    local name="$1"
    if [ -z "name" ]; then
        echo "Might I suggest visiting a doctor? You seem to be having memory problems"
        exit 1
    fi
    if [ -e "$name" ]; then
        filesize=(stat -c%s "name")
        echo "The size of $name is: $filesize bytes"
    else
        echo "$name does not exist"
    fi
}

help_menu(){
    echo "Format: $0 [OPTION] <filename>"
    echo "Options:"
    echo " -c <filename> Create an empty file"
    echo " -d <filename> Delete the selected file"
    echo " -s <filename> Get the size of the selected file"
    echo " -h  Display this help message" 
}

if [ $# -eq 0 ]; then
    echo "Incorrect Format, see the help menu for options."
    help_menu
    exit 0
fi

case "$1" in
    -c)
        create_file "$2"
        ;;
    -d)
        delete_file "$2"
        ;;
    -s)
        file_size "$2"
        ;;
    -h)
        help_menu
        ;;
    *)
        echo "Unknown OPTION please -h for the help menu: "
        exit
        ;;
esac