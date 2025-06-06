#!/bin/bash
while true; do
	echo " Hello user, please choose a number below"
	echo "
	1) heart_rate_log.log
	2) temperature_log.log
	3) water_usage_log.log "
	read -p "Enter number: " choice

	case $choice in 
		1)
		original="/Gatchaman/hospital_data/active_logs/heart_rate_log.log"
		timestamp=$(date -r "$original" +"%Y-%m-%d_%H:%M:%S")
		new="heart_rate_${timestamp}.log"
		mv "$original" "$new"
		echo "Archiving heart_rate.log..."
		dest_archive="/Gatchaman/hospital_data/archived_logs/heart_data_archive" 
		mv "$new" "$dest_archive/"
		echo "✔️Successfully archived to heart_data_archive/$new"
		break
		;;
		2)
       		original="/Gatchaman/hospital_data/active_logs/temperature_log.log"
   		timestamp=$(date -r "$original" +"%Y-%m-%d_%H:%M:%S")
       	 	new="temperature_${timestamp}.log"
		mv "$original" "$new"
		echo "Archiving temperature.log..."
		dest_archive="/Gatchaman/hospital_data/archived_logs/temperature_data_archive"
       		mv "$new" "$dest_archive/" 
		echo "✔️Successfully archived to temperature_data_archive/$new"
		break
		;;
		3)
	        original="/Gatchaman/hospital_data/active_logs/water_usage_log.log"
        	timestamp=$(date -r "$original" +"%Y-%m-%d_%H:%M:%S")
	        new="water_usage_${timestamp}.log"
		mv "$original" "$new"
		echo "Archiving water_usage.log..."
		dest_archive="/Gatchaman/hospital_data/archived_logs/water_usage_data_archive"
	        mv "$new" "$dest_archive/"
		echo "✔️Successfully archived to water_usage_archive/$new"
		break
		;;
		*)
		echo "your choice is incorrect try again btn (1-3)"
		;;
	esac
done
touch "$original"

if [ ! -f "$original" ]; then
	echo "oops!! Log file $original not found."
    	exit 1
fi
if [ ! -d "$dest_archive" ]; then
	echo "Archive directory "$dest_archive/" not found. Check again"
fi
if [ -f "$dest_archive/$new" ]; then
    echo "Well done🎊🎊"
else
    echo "Failed to move $new to its destination archive"
fi
