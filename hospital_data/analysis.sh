#!/bin/bash
echo "
Select log file to analyze:
1) Heart Rate (heart_rate.log)
2) Temperature (temperature.log)
3) Water Usage (water_usage.log)"
read -p "Enter choice (1-3): " input
case $input in 
	1)
    	awk '{print $3}' /Gatchaman/hospital_data/active_logs/heart_rate_log.log | sort | uniq -c | sort -n
	echo " the most recent input is ....."
	awk '{print $1," ",$2}' /Gatchaman/hospital_data/active_logs/heart_rate_log.log |sort -nr | head -n 1
	echo " the first input was at ..."
	awk '{print $1," ",$2}' /Gatchaman/hospital_data/active_logs/heart_rate_log.log |sort -nr | tail -n 1
	;;

	2)
	awk '{print $3}' /Gatchaman/hospital_data/active_logs/temperature_log.log | sort | uniq -c | sort -nr
        echo " the most recent input is ....."
        awk '{print $2}' /Gatchaman/hospital_data/active_logs/temperature_log.log |sort -nr | head -n 1
        echo " the first input was at ..."
        awk '{print $2}' /Gatchaman/hospital_data/active_logs/temperature_log.log |sort -nr | tail -n 1
	;;
	
	3)
	awk '{print $3}' /Gatchaman/hospital_data/active_logs/water_usage_log.log | sort | uniq -c | sort -nr
        echo " the most recent input is ....."
        awk '{print $2}' /Gatchaman/hospital_data/active_logs/water_usage_rate_log.log |sort -nr | head -n 1
        echo " the first input was at ..."
        awk '{print $2}' /Gatchaman/hospital_data/active_logs/water_usage_log.log |sort -nr | tail -n 1
	;;

	*)
	echo "Entered a wrong number, please choose between 1-3"
	echo "
	Select log file to analyze:
	1) Heart Rate (heart_rate.log)
	2) Temperature (temperature.log)
	3) Water Usage (water_usage.log)"
	read -p "Enter choice (1-3): "input
	;;
esac
