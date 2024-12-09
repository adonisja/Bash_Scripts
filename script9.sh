#!/bin/bash

grep -i 'Error' ~/Documents/ClassAssignments/CS265/Other/log_backups/error.log | awk '{print $2, $3}' > errors.txt

sed 's/://g' ./errors.txt