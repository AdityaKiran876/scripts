#!/bin/bash


<<Comments

Comments

# Defined a function to check the process status
process_check() {
	
	echo "--------------Monitor a specific service----------------"
	read -p "Please enter the process name: " option
	while true; do

        	status=$(sudo systemctl is-active "$option")

		if [[ $status == "inactive" ]]; then
			read -p "Do you want to start the process (Y/N): " choice
			if [[ "$choice" == "Y" ]]; then
				
				echo "Restarting the process : "$option"...."
        			sudo systemctl restart $option
				continue
			elif [[ "$choice" == "N" ]]; then
				 
				echo "Exiting........."
				break
			else
				echo "Invalid option. Please press choose (Y/N): "
				continue
			fi
		else
		        echo "The process $option is running....."
                        break
		fi
	done	
}

monitor() {

	echo "----------System Metrics------------------"
	echo "Disk Usage: $(df -h . | awk 'NR==2 {print $5}') | CPU Usage: $(sar 2 2 | awk 'NR==6 {print (100 - $8)"% used"}') | Memory Usage: $(free -m | awk 'NR==2{printf "%.2f%\n", $3*100/$2}')"

}

#Main Code

while true; do

	echo "---- Monitoring Metrics Script ----"
	echo "1. View System Metrics"
	echo "2. Monitor a specific service"
	echo "3. Exit"

	read -p "Choose from the above options: " option

	case $option in 
		1)
			monitor
			;;
		2)
			process_check
			;;
		3)
			echo "Exiting........"
			break
			;;
		*)
			echo "Invalid Input."
			;;
	esac
	while true; do
		read -p "Press Enter to continue " enter
		if [[ -z "$enter" ]]; then
			break
		else 
			echo "Invalid Option. Press enter to continue."
		fi
	done

done
