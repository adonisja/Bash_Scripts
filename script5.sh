#!/bin/bash

# Display the list of available fruits
echo "These are the fruits available:"
cut -d',' -f1 ~/Documents/ClassAssignments/CS265/Other/Fruits.txt
echo ""

# Display the list of fruits and their colors
echo "This is the list of fruits and their colors:"
awk -F',' '{printf "Fruit: %s | Color: %s\n", $1, $2}' ~/Documents/ClassAssignments/CS265/Other/Fruits.txt > ~/Documents/ClassAssignments/CS265/Other/Fruits2.txt
cat ~/Documents/ClassAssignments/CS265/Other/Fruits2.txt
echo ""

# Display the list of red fruits (case-insensitive) and append to Fruits2.txt
echo "These are the red fruits:"
awk -F',' 'tolower($2) ~ /red/ {print $1}' ~/Documents/ClassAssignments/CS265/Other/Fruits.txt >> ~/Documents/ClassAssignments/CS265/Other/Fruits2.txt

echo "These are the red fruits:"

# Append the current date to the file
echo "Current Date: $(date)" >> ~/Documents/ClassAssignments/CS265/Other/Fruits2.txt

# Display the content of Fruits2.txt to verify the date was appended
cat ~/Documents/ClassAssignments/CS265/Other/Fruits2.txt