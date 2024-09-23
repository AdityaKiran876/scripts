#!/bin/bash

<<Comments
This script is used to create , delete and manage users in the server.
Please use this carefully.
Usage: ./usermanagement.sh [OPTIONS]
Comments

create_user() {
	read -p "Enter the username: " username
	dupli=$( cat /etc/passwd | cut -d: -f1 | grep $username )
	if [[ $username == $dupli ]];
	then
		echo "The username exists. Please try with another username"

	else 
		read -p "Enter the password: " password
        	read -p "Enter your email ID: " email

		sudo useradd -c $email -p $password -m $username
	fi
}

delete_user() {
	
	read -p "Enter the username to be deleted: " username
	
	dupli=$( cat /etc/passwd | cut -d: -f1 | grep $username )

        if [[ $username == $dupli ]];
        then
                sudo userdel -r $username

        else
                 echo "The username is not present. Please try with another username"
        fi
}

passwd_reset() {
	read -p "Enter the username to change password: " username

	sudo passwd $username
}

help_list() {
	echo "Usage : ./user_management.sh [OPTIONS]"
	echo "Options:"
	echo "  -c, --create Create a new user account."
	echo "  -d, --delete Delete an existing user account."
	echo "  -r, --reset  Reset password for existing user account."
	echo "  -l, --list   List all the user accounts on the system."
	echo "  -h, --help   Display this help and exit."
}

list() {
	
	echo "User accounts on the system:"
	awk -F: '{print "- " $1, "(UID- "$3 ")"}' /etc/passwd

}

option=$1

if [ $# -eq 0 ] || [ "$option" == "-h" ] || [ "$option" == "--help" ];
then
	help_list
	exit 0

fi

case "$1" in
	-c | --create)
		create_user 
		;;
	-d | --delete)
		delete_user
		;;
	-r | --reset)
		passwd_reset
		;;
	-l | --list)
		list
		;;
	*)
		echo "Invalid option. Use -h or --help to see the options."
		exit 1
esac



