#!/bin/bash
<<Readme
This script takes backup of any given directory.
Usage:
./backupscript.sh <path of directory>
Readme
src_dir=$1
#target_dir=$2
timestamp=$(date '+%Y-%m-%d-%H-%M-%S')
backup_dir="${src_dir}/backup_${timestamp}"

function create_backup {
	
	zip -r "${backup_dir}.zip" "${src_dir}" > /dev/null
	if [ $? -eq 0 ]; then
		echo "Backup is completed"
	else
		echo "Backup was not taken for $timestamp"
	fi
}
function backup_rotation {
	backups=($(ls -t "$src_dir/backup_"*.zip))
	if [ "${#backups[@]}" -gt 3 ]; then
		backupstoremove=("${backups[@]:3}")
		for backup in "${backupstoremove[@]}";
		do
			rm "$backup"
		done
	fi


}
create_backup
backup_rotation
