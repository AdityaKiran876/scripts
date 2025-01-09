#!/bin/bash

echo "______________________Log Analyzer Report_______________________________________"

echo 
date

if [[ -z "$1" ]]; then
	echo "Usage: ./Log_Analyzer.sh <Path of the filename>."
	echo "Use this script with an argument."
fi
echo "Log file analyzed: "$1""

if [[ wc-l == 0 ]]; then
	echo "There are no logs in the file. Please slelect a file containing logs."
fi
echo "Total Lines processed: "$(wc -l < $1)""

if [[ $( grep -c -i "ERROR" $1 ) == 0 ]]; then
	
fi
echo "Total error lines count: $( grep "ERROR" $1 -c )"
echo

echo "--------List of top errors--------"

head $1 | grep -i -n "ERROR"
echo
echo "----------------List of Critical Events----------------------------"
grep -n "CRITICAL" $1
