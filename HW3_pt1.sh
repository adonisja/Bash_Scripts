#!/bin/bash

cut -d',' -f1,3 ~/Documents/ClassAssignments/CS265/Other/employees.csv > ~/Documents/ClassAssignments/CS265/Other/salary.csv

awk -F',' 'NR > 1 {sum += $2; count++} END {if (count > 0) print "Average Salary:", sum/count "\n"}' ~/Documents/ClassAssignments/CS265/Other/salary.csv | tee -a ~/Documents/ClassAssignments/CS265/Other/salary.csv

cut -d',' -f2 ~/Documents/ClassAssignments/CS265/Other/employees.csv | sort | uniq

awk -F',' 'BEGIN {print "\nEmployees Earning above 80k\n"} $3 > 80000 {print $1, $3}' ~/Documents/ClassAssignments/CS265/Other/employees.csv