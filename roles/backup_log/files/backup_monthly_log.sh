#! /usr/bin/sh

# find all log dir from target Linux machine
find / -name 'logs' -type d >> log_folder_list.txt
find / -name 'log' -type d >> log_folder_list.txt

# find the file which modify in 24hour; split big file
while read check_log_file
do
  if [ -s "$check_log_file" ];then
    find $check_log_file -mtime -1 -size -10M -type f >> log_file.txt
    find $check_log_file -mtime -1 -size +10M -type f >> log_file_large.txt
  fi
done < log_folder_list.txt

# Put the filtered log files into the specified directory
DATE=$(date +%Y%m%d)
mkdir -p /backup_log/$DATE
while read path
do
  tmp=`echo ${path//\//_}`
  log=`echo ${tmp#_}`
  cp $path /backup_log/$DATE/$log
done < log_file.txt

# clean up
rm -rf log_folder_list.txt log_file.txt log_file_large.txt deploy_log_file.sh
