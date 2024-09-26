#!/bin/bash


<<Comments
This script takes input from the arguments to check about any particular process running or stopped
If it is stopped it will restart the process
Usage: ./process.sh <Name of the service>
Example : ./process.sh nginx
Comments

# Defined a function to check the process status
process_check() {
	process=$1

	status=$(sudo systemctl is-active "$service_name")
	echo "$status"

}

#Restarts the process 
process_restart(){
	name=$1
	echo "Restarting the process : "$name"...."
	sudo systemctl restart $name

}

#Main section
if [ -z "$1" ]; then
    echo "Usage: $0 <service_name>"
    exit 1
fi

for (( i=1; i<=3; i++ )); 
do
	status1=$(process_check $1)

	if [[ $status1 == "inactive" ]]; then
		echo "Process $1 is not running. Attempting to restart..."
		process_restart $1
	else 
		echo "$1 is $status1 now."
	fi	
done

echo "Maximum restart attempts reached. Please check the process manually."
