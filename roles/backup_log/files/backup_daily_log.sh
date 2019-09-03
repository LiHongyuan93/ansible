#! /usr/bin/sh

# Parameters
#ip=$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1 -d '/')
time=$(date +%Y%m%d -d'-1 day')
dir_path=/GYMBOREE/Backup/Daily


# clean up env
rm -rf backup_daily_log.sh log_file.txt log_folder_list.txt test_dir.txt test_file.txt test_folder.txt
sudo yum install -y zip unzip 

# find all log dir from target Linux machine
find / -name 'logs' -type d >> log_folder_list.txt
find / -name 'log' -type d >> log_folder_list.txt

# find the log file which modify in 24hour;
while read check_log_file
do
  if [ -s "$check_log_file" ];then
    find $check_log_file -mtime -1 -size +0M -type f >> log_file.txt
  fi
done < log_folder_list.txt

# Put the filtered log files into the specified directory
mkdir -p $dir_path/$time


while read line
do
  i=1
  dir=`echo ${line%/*}`
  file=`echo ${line##*/}`
  split=`echo ${dir//\//_}`
  folder_name=`echo ${split#_}`
  echo $file >> test_file.txt
  echo $dir >> test_dir.txt
  echo $folder_name >> test_folder.txt
  mkdir -p $dir_path/$time/$folder_name
  cp $line $dir_path/$time/$folder_name/
  while [ $i -lt 5 ];do
    if [ -s $dir_path/$time/$folder_name/$file ]; then
      break
    fi
    cp $line $dir_path/$time/$folder_name/
    let i++;
  done
 # rm -rf $line
done < log_file.txt

cd $dir_path
zip -r $time.zip $time
rm -rf $time

# clean up env
rm -rf backup_daily_log.sh log_file.txt log_folder_list.txt test_dir.txt test_file.txt test_folder.txt
