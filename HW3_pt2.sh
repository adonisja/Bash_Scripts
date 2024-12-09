#!/bin/bash

input_file=~/Documents/ClassAssignments/CS265/Other/error_log.txt
temp_file=~/Documents/ClassAssignments/CS265/Other/temp_log.txt
output_file=~/Documents/ClassAssignments/CS265/Other/processed_log.txt

sed 's/ERROR/CRITICAL/g' $input_file > $temp_file

sed '/INFO/d' $temp_file > $temp_file.tmp && mv $temp_file.tmp $temp_file

echo "Log Analysis Report" | cat - $temp_file > $temp_file.tmp && mv $temp_file.tmp $temp_file

awk '!seen[$0]++' $temp_file > $temp_file.tmp && mv $temp_file.tmp $temp_file

awk '$2 < "14:24:22" || $2 > "14:27:55"' $temp_file > $output_file

rm $temp_file

cat $output_file