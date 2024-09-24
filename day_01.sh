#!/bin/bash
#Task 1 : Comments
#Created a script which adds two numbers
#This script will also show the hostname and current date

## Task  5: Using Built-in Variables
a=$(date)
b=$(hostname)
pwd
# Task  3 and 4: Using Variables
c=5
d=7
e=$((c + d))

#Task 2
echo "$a"
echo "$b"
echo "The sum of $c and $d is : $e"

#Task  6: Wildcards
# Lists the files with the particular extension

ls *.sh

