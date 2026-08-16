#!/bin/bash

# 1-define the cleanup function
cleanup() {
        echo -e "\nprocess interrupted! saving and cleaning up..."
        # check if directory exist before saving
        if [ -n "$DIR_NAME" ] && [ -d "attendance_tracker_${DIR_NAME}" ]; then
        	tar -czf "attendance_tracker_${DIR_NAME}_archive.tar.gz" "attendance_tracker_${DIR_NAME}"
		rm -rf "attendance_tracker_${DIR_NAME}"
       	fi
	exit 1
}

# 2-setting the trap
trap cleanup SIGINT

# 3-print input
read -p "Enter project identifier: " DIR_NAME

#directory is being created, files are copied
mkdir -p "attendance_tracker_${DIR_NAME}/Helpers"
mkdir -p "attendance_tracker_${DIR_NAME}/reports"

#files are being copied to their respective directotry
cp attendance_checker.py "attendance_tracker_${DIR_NAME}/"
cp assets.csv config.json "attendance_tracker_${DIR_NAME}/Helpers/"
cp reports.log "attendance_tracker_${DIR_NAME}/reports/"

#ask the user if he wants to update the threshold values
read -p "Do you want to update attendance thresholds? (y/n): " Choice

#check if the answer is "y" or "Y"
if [[ "$Choice" =~ ^[Yy]$ ]]; then

	#the user will prompt the new valeus using read if based on his choice
	read -p "Enter Warning threshold (default 75): " WARN_VAL
	read -p "Enter Failure threshold (default 50): " FAIL_VAL

	#if n values where entered the code will find default numbers in config.json using sed -i
	sed -i "s/75/${WARN_VAL}/g" "attendance_tracker_${DIR_NAME}/Helpers/config.json"
	sed -i "s/50/${FAIL_VAL}/g" "attendance_tracker_${DIR_NAME}/Helpers/config.json"
	echo "Thresholds values updated succesfully."
else
	echo "default values retained."
fi 
#checking if python3 exist
	if python3 --version &> /dev/null; then
		echo "Health Check Passed: $(python3 --version) is  installed."
	else 
		echo "Warning: python3 is not installed on this computer."
	fi
