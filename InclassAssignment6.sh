#!/bin/bash


cut -d',' -f1,3 ~/Documents/ClassAssignments/CS265/Other/customer_data.csv > ~/Documents/ClassAssignments/CS265/Other/extracted_contacts.csv


sort -t',' -k1,1 ~/Documents/ClassAssignments/CS265/Other/extracted_contacts.csv > ~/Documents/ClassAssignments/CS265/Other/sorted_contacts.csv


cut -d',' -f1 ~/Documents/ClassAssignments/CS265/Other/sorted_contacts.csv | tr '[:lower:]' '[:upper:]' > ~/Documents/ClassAssignments/CS265/Other/capitalized.txt
cut -d',' -f2 ~/Documents/ClassAssignments/CS265/Other/sorted_contacts.csv > ~/Documents/ClassAssignments/CS265/Other/phones.txt
paste -d',' ~/Documents/ClassAssignments/CS265/Other/capitalized.txt ~/Documents/ClassAssignments/CS265/Other/phones.txt > ~/Documents/ClassAssignments/CS265/Other/uppercase_contacts.csv


cat ~/Documents/ClassAssignments/CS265/Other/uppercase_contacts.csv