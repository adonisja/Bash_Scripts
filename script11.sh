#!/bin/bash

sort -t, -k3,3n ~/Documents/ClassAssignments/CS265/Other/employees.csv | 
awk -F',' 'NR > 1 {printf "Name: %-15s | Department: %-15s | Salary: %-10s\n", $1, $2, $3}'