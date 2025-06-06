#!/bin/bash
#Ask the user to choose the file they want to work with
#there is a while statement because we want the user to be prompted again to choose a number when they've chosen an invalid input
while true; do
echo "
Select log file to analyze:
1) Heart Rate (heart_rate.log)
2) Temperature (temperature.log)
3) Water Usage (water_usage.log)"

read -p "Enter choice (1-3): " user_input

case "$user_input" in

	1)	
		#there was corrupted data in the heart_rate_log.log file where we had  device data with no device name and time,used set -x to debug every line,had to add a condition of checking if there are 3 columns. 
		device_count=$(awk 'NF>=3 {print $3}' /Gatchaman/hospital_data/active_logs/heart_rate_log.log | sort | uniq -c | sort -n)
		echo "$device_count"
		echo "$device_count" >> /Gatchaman/hospital_data/reports/analysis_report.txt
                last_time=$(awk '{print $1," ",$2}' /Gatchaman/hospital_data/active_logs/heart_rate_log.log |sort -nr | head -n 1)
                echo "the last time the heart  monitor recorded : $last_time"
                first_time=$(awk '{print $1," ",$2}' /Gatchaman/hospital_data/active_logs/heart_rate_log.log | sort | head -n 1)
                echo "the very first time the heart  monitor recorded: $first_time"
                echo "the last time the heart monitor recorded was at $last_time" >> /Gatchaman/hospital_data/reports/analysis_report.txt
                echo "the first time the heart monitor recorded was at  $first_time" >> /Gatchaman/hospital_data/reports/analysis_report.txt
		#added a new line after the report to avoid congestion of data
		echo -e "\n" >> /Gatchaman/hospital_data/reports/analysis_report.txt
		break
		;;
	

	2)
		device_count=$(awk '{print $3}' /Gatchaman/hospital_data/active_logs/temperature_log.log | sort | uniq -c | sort -n)
		echo "$device_count"
                echo "$device_count" >> /Gatchaman/hospital_data/reports/analysis_report.txt
                last_time=$(awk '{print $1," ",$2}' /Gatchaman/hospital_data/active_logs/temperature_log.log |sort -nr | head -n 1)
                echo "the last time the temperature monitor recorded : "$last_time""
                first_time=$(awk '{print $1," ",$2}' /Gatchaman/hospital_data/active_logs/temperature_log.log | sort | head -n 1)
                echo "the very first time the temperature monitor recorded: "$first_time""
                echo "the last time the temperature monitor recorded was at "$last_time"" >> /Gatchaman/hospital_data/reports/analysis_report.txt
		echo "the first time the temperature monitor recorded was at  "$first_time"" >> /Gatchaman/hospital_data/reports/analysis_report.txt
		echo -e "\n" >> /Gatchaman/hospital_data/reports/analysis_report.txt
		break
		;;
	
	3)      device_count=$(awk '{print $3}' /Gatchaman/hospital_data/active_logs/water_usage_log.log | sort | uniq -c)
		echo "$device_count"
                echo "$device_count" >> /Gatchaman/hospital_data/reports/analysis_report.txt
                last_time=$(awk '{print $1," ",$2}' /Gatchaman/hospital_data/active_logs/water_usage_log.log |sort -nr | head -n 1)
                echo "the last time the water usage monitor recorded : $last_time"
                first_time=$(awk '{print $1," ",$2}' /Gatchaman/hospital_data/active_logs/water_usage_log.log | sort | head -n 1)
                echo "the very first time the water usage  monitor recorded: $first_time"
                echo "the last time the water usage monitor recorded was at $last_time" >> /Gatchaman/hospital_data/reports/analysis_report.txt
                echo "the first time the water usage monitor recorded was at  $first_time" >> /Gatchaman/hospital_data/reports/analysis_report.txt
		echo -e "\n" >> /Gatchaman/hospital_data/reports/analysis_report.txt
		break
		;;

	*)
		echo "Entered a wrong number, choose only (1-3)"
		;;
esac
done
#there is a break at the end of  each user_input choice  so that the user won't be prompted again and again
#if the reports file doesn't exist
if [ ! -f "/Gatchaman/hospital_data/reports/analysis_report.txt" ];then
	echo " The report was not pushed to reports file"
else 
	echo "succesffully recorded in /reports/analysis_report.txt"
fi
