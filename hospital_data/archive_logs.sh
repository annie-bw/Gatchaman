#!/bin/bash
<<<<<<< HEAD
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
=======

echo "Hello user, please choose a number below"
echo "1) heart_rate_log.log
2) temperature_log.log
3) water_usage_log.log"
read -p "Enter number: " choice

case $choice in
    1)
        original="/Gatchaman/hospital_data/active_logs/heart_rate_log.log"
        archive_dir="/Gatchaman/hospital_data/archived_logs/heart_data_archive"

        # Check that the original file exists
        if [ ! -e "$original" ]; then
            echo "Error: \"$original\" does not exist."
            exit 1
        fi

        # Generate a timestamp based on the original file’s modification time
        if ! timestamp=$(date -r "$original" +"%Y-%m-%d_%H:%M:%S"); then
            echo "Error: Failed to get timestamp for \"$original\"."
            exit 1
        fi

        new="heart_rate_${timestamp}.log"

        # Ensure the archive directory exists
        if ! mkdir -p "$archive_dir"; then
            echo "Error: Could not create directory \"$archive_dir\"."
            exit 1
        fi

        # Move the original to a timestamped filename
        if mv "$original" "$new"; then
            echo "Renamed \"$original\" → \"$new\""
        else
            echo "Error: Failed to rename \"$original\"."
            exit 1
        fi

        echo "Archiving heart_rate.log to \"$archive_dir\"..."
        if mv "$new" "$archive_dir/"; then
            echo "Successfully archived to \"$archive_dir/$new\""
        else
            echo "Error: Failed to move \"$new\" to \"$archive_dir\"."
            # Attempt to roll back if the first mv succeeded but the second failed
            if [ -e "$new" ]; then
                mv "$new" "$original" 2>/dev/null
            fi
            exit 1
        fi
        ;;
    2)
        original="/Gatchaman/hospital_data/active_logs/temperature_log.log"
        archive_dir="/Gatchaman/hospital_data/archived_logs/temperature_data_archive"

        if [ ! -e "$original" ]; then
            echo "Error: \"$original\" does not exist."
            exit 1
        fi

        if ! timestamp=$(date -r "$original" +"%Y-%m-%d_%H:%M:%S"); then
            echo "Error: Failed to get timestamp for \"$original\"."
            exit 1
        fi

        new="temperature_${timestamp}.log"

        if ! mkdir -p "$archive_dir"; then
            echo "Error: Could not create directory \"$archive_dir\"."
            exit 1
        fi

        if mv "$original" "$new"; then
            echo "Renamed \"$original\" → \"$new\""
        else
            echo "Error: Failed to rename \"$original\"."
            exit 1
        fi

        echo "Archiving temperature.log to \"$archive_dir\"..."
        if mv "$new" "$archive_dir/"; then
            echo "Successfully archived to \"$archive_dir/$new\""
        else
            echo "Error: Failed to move \"$new\" to \"$archive_dir\"."
            if [ -e "$new" ]; then
                mv "$new" "$original" 2>/dev/null
            fi
            exit 1
        fi
        ;;
    3)
        original="/Gatchaman/hospital_data/active_logs/water_usage_log.log"
        archive_dir="/Gatchaman/hospital_data/archived_logs/water_usage_data_archive"

        if [ ! -e "$original" ]; then
            echo "Error: \"$original\" does not exist."
            exit 1
        fi

        if ! timestamp=$(date -r "$original" +"%Y-%m-%d_%H:%M:%S"); then
            echo "Error: Failed to get timestamp for \"$original\"."
            exit 1
        fi

        new="water_usage_${timestamp}.log"

        if ! mkdir -p "$archive_dir"; then
            echo "Error: Could not create directory \"$archive_dir\"."
            exit 1
        fi

        if mv "$original" "$new"; then
            echo "Renamed \"$original\" → \"$new\""
        else
            echo "Error: Failed to rename \"$original\"."
            exit 1
        fi

        echo "Archiving water_usage.log to \"$archive_dir\"..."
        if mv "$new" "$archive_dir/"; then
            echo "Successfully archived to \"$archive_dir/$new\""
        else
            echo "Error: Failed to move \"$new\" to \"$archive_dir\"."
            if [ -e "$new" ]; then
                mv "$new" "$original" 2>/dev/null
            fi
            exit 1
        fi
        ;;
    *)
        echo "Your choice is incorrect. Please enter a number between 1 and 3."
        exit 1
        ;;
esac
>>>>>>> 8e3bee468721d7bb7268e5689f7557ab8d90ff1b
