#! /usr/bin/sh

# clean up
rm -rf backup_weekly_log.sh 

## Parameters
time=$(date +%Y%m%d -d'-1 day')
dir_weekly_path=/GYMBOREE/Backup/Weekly
dir_daily_path=/GYMBOREE/Backup/Daily
daily_file_list=`ls $dir_daily_path`
first_date=`ls -ltr $dir_daily_path | awk 'NR==2{print}' | awk '{print $9}' | awk -F '.' '{print $1}'`
last_date=`ls -ltr $dir_daily_path | tail -n 1 | awk '{print $9}' | awk -F '.' '{print $1}'`

## Get date
mkdir -p $dir_path/$first_date-$last_date
cp $dir_daily_path/*.zip $dir_path/$first_date-$last_date/

# clean up
rm -rf backup_weekly_log.sh 
