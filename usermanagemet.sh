#!/bin/bash

<<Comments
This script is used to create , delete and manage users in the server.
Please use this carefully.
Usage: ./usermanagement.sh [OPTIONS]
Comments

#Function to create user
create_user() {
	read -p "Enter the username: " username
	if id "$username" &>/dev/null;then
		
		echo "The username exists. Please try with another username"
		return 1
	fi
		
		read -p "Enter the password: " -s password
        	read -p "Enter your email ID: " email

		sudo useradd -c "$email" -m "$username"
		echo "$username:$password" | sudo chpasswd

		echo "User '$username' created succesfully"
}

#Function to delete user
delete_user() {
	
	read -p "Enter the username to be deleted: " username

        if id "$username" &>/dev/null;then
                sudo userdel -r "$username"
		echo "User '$username' deleted succesfully."

        else
                 echo "The username is not present. Please try with another username"
		 return 1
        fi
}

#Function to reset password
passwd_reset() {
	read -p "Enter the username to change password: " username

	if id "$username" &>/dev/null;then
		sudo passwd "$username"
	else 
		echo "The username '$username' does not exist."
		return 1
	fi
}

#Function to show help and all options
help_list() {
	echo "Usage : ./user_management.sh [OPTIONS]"
	echo "Options:"
	echo "  -c, --create Create a new user account."
	echo "  -d, --delete Delete an existing user account."
	echo "  -r, --reset  Reset password for existing user account."
	echo "  -l, --list   List all the user accounts on the system."
	echo "  -h, --help   Display this help and exit."
}

#Function to list all the users in the system
list_users() {
	
	echo "User accounts on the system:"
	awk -F: '{print "- " $1, "(UID- "$3 ")"}' /etc/passwd

}


#Main script logic

if [ $# -eq 0 ]; then
	help_list
	exit 0
fi

#Switch case to handle options
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
		list_users
		;;
	-h | --help)
		help_list
		;;
	*)
		echo "Invalid option. Use -h or --help to see the options."
		exit 1
esac



