#!bin/bash

awk -F',' 'NR > 1 && $3 > 80000 {printf "Name: %-15s | Department: %-15s | Salary: %-10s\n", $1,  $2,  $3}' ~/Documents/ClassAssignments/CS265/Other/employees.csv