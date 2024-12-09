#!/bin/bash

# Function to display usage information
usage() {
    echo "Usage: $0 -f <folder> -d <disk_image_name>"
    exit 1
}

# Parse command-line options
while getopts "f:d:" opt; do
    case $opt in
        f) FOLDER=$OPTARG ;;
        d) DISK_IMAGE_NAME=$OPTARG ;;
        *) usage ;;
    esac
done

# Check if folder and disk image name are provided
if [[ -z "$FOLDER" || -z "$DISK_IMAGE_NAME" ]]; then
    usage
fi

# Check if the folder exists
if [[ ! -d "$FOLDER" ]]; then
    echo "Error: Folder '$FOLDER' does not exist."
    exit 1
fi

# Create an encrypted disk image from the folder
hdiutil create -encryption -stdinpass -srcfolder "$FOLDER" -volname "$DISK_IMAGE_NAME" -fs HFS+ -format UDZO "$DISK_IMAGE_NAME.dmg"

# Check if the disk image was created successfully
if [[ $? -eq 0 ]]; then
    echo "Disk image '$DISK_IMAGE_NAME.dmg' created successfully."
    echo "You can delete the original folder '$FOLDER' if you want to keep it secure."
else
    echo "Error: Failed to create disk image."
    exit 1
fi

# Function to mount the disk image
mount_disk_image() {
    hdiutil attach "$DISK_IMAGE_NAME.dmg" -stdinpass
}

# Function to unmount the disk image
unmount_disk_image() {
    hdiutil detach "/Volumes/$DISK_IMAGE_NAME"
}

# Provide instructions to the user
echo "To mount the disk image, run: $0 -m"
echo "To unmount the disk image, run: $0 -u"

# Parse command-line options for mounting and unmounting
while getopts "mu" opt; do
    case $opt in
        m) mount_disk_image ;;
        u) unmount_disk_image ;;
        *) usage ;;
    esac
done