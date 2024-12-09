#!/bin/bash

# Combine the contents of fruitnames.txt and fruit_colors.txt, separated by commas, and save to a file
paste -sd"," ~/Documents/ClassAssignments/CS265/Other/fruitnames.txt ~/Documents/ClassAssignments/CS265/Other/fruit_colors.txt > ~/Documents/ClassAssignments/CS265/Other/combined_fruits.txt

# Display the first 10 lines of EmployeesData.csv in a tabular format
head -n 10 ~/Documents/ClassAssignments/CS265/Other/EmployeesData.csv | column -ts,

# Sort the entire EmployeesData.csv by surname (last name in the first column) and display the first 10 lines in a tabular format
sort -t, -k1,1 ~/Documents/ClassAssignments/CS265/Other/EmployeesData.csv | head -n 10 | column -ts,

# Sort the entire EmployeesData.csv by joining date (fourth column) from oldest to newest and display the first 10 lines in a tabular format
sort -t, -k4,4 ~/Documents/ClassAssignments/CS265/Other/EmployeesData.csv | head -n 10 | column -ts,