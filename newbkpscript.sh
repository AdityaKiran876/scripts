#!/bin/bash
<<Comment

This is a script which will take backup of the provided files in a folder
and copies the backup file to another server as well.

Comment

read -p "Enter the location where the files are placed: " sourcedir

read -p "Enter the location where the backup will be placed: " targetdir

Date=$(date +'%Y%m%d')
Bkp_name="${Date}_Backup "

zip -r "${sourcedir}/${Bkp_name}.zip"
