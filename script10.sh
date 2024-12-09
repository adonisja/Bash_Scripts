#!/bin/bash

awk -F',' 'NR > 1{
    printf "Name: %-15s | Salary: %-10s\n", $1, $3
    total_salary += $3 
}
END{ printf "\nTotal Salary: %s\n\n", total_salary}' ~/Documents/ClassAssignments/CS265/Other/employees.csv

# Note: Adding %-15 or %-10, formats the output to a fixed with of the given number left-justified
#       total_salary variable adds salary (field 3) consecutively
#       END command processes the second printf function after all previous functions are completed
#