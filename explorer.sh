#!/bin/bash
<<Comments
This script displays all the files in the current directory.
It also will read input from a user and display the number of characters in the prompt entered by the user
To use this script give command ./explorer.sh
Comments

echo "Welcome to the Interactive File and Directory Explorer!"

#This function shows the files and directories and their size
fileslisting() {

	echo "Files and directories in current path :"

	ls -sh | awk 'NR>1 {print "-"$2 " ("$1")"}'
}


#Taking continuous loop with true
while true
do

	fileslisting
	
#Reading input from user to check if the user wants to continue or exit
	read -p "Do you want to see the files again? If yes type y if no type n: " option

	if [ $option == "y" ]; then
		continue

	elif [ $option == "n" ]; then
		echo "...."
#Exiting from the loop 
		break
  	else 
   		echo "Please choose correct option (y/n)."
	fi
	break
done
#Using while loop until the if condition is satisfied
while true 
do
#Taking input from a user 
	read -p "Enter a line of text (Press Enter without text to exit): " line
#This will count the number of characters in a string
	echo "Character Count: ${#line}"
#If the character count is 0 then this will exit the loop and come out of while loop as well
	if [ ${#line} -eq 0 ];
	then
		break
	else 
		continue
	fi
	break
done

echo "Exiting the Interactive Explorer. Goodbye!"

