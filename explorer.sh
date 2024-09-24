#!/bin/bash
<<Comments
This script displays all the files in the current directory.
It also will read input from a user and display the number of characters in the prompt entered by the user
To use this script give command ./explorer.sh
Comments

echo "Welcome to the Interactive File and Directory Explorer!"

#Taking continuous loop with true
while true
do
#To list files and directories in the current path

	echo "Listing Files and Directories :"

        ls -sh | awk 'NR>1 {print "-"$2 " ("$1")"}'
	
#Reading input from user to check if the user wants to continue or exit
	read -p "Do you want to see the files again? If yes type y if no type n: " option

	if [[ "$option" == "y" ]]; then
		continue

	elif [[ $option == "n" ]]; then
		echo "Exiting file listing...." 
		break
  	else 
   		echo "Please choose correct option (y/n)."
		continue
	fi
done

#Using while loop until the user enters an empty line

while true; do

#Taking input from a user 
	
	read -p "Enter a line of text (Press Enter without text to exit): " line

#Check if the input is empty

	if [ ${#line} -eq 0 ];
	then
		echo "Exiting character counting..."
		break
	fi

#Display the character count of the input

	echo "Character Count: ${#line}"
done

echo "Exiting the Interactive Explorer. Goodbye!"

