#!/bin/bash
mkdir chaining_test && cd chaining_test
touch example.txt && ls
rm testfile.txt || echo "Failed to remove testfile.txt. File does not exist"
ls | grep ".txt"
#for file in *.txt; do
#    echo "$file was found!"
#done