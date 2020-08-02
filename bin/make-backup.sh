#!/bin/bash
 
readonly LOG_LOC="/var/log/mybackup.log"

function check_dir_loc {
  [ ! -s "/backup_dirs.conf" ] && echo "create a list of directories to backup by creating a backups_dir.conf file in the root directory" && exit 1
}

function check_backup_loc {
  [ ! -s "/backup_loc.conf" ] && echo "specify the full path of where to send the bachup to, by creating the backups_loc.conf in the root directory" && exit 1
}

function check_schedule {
  [ ! -s "/etc/cron.weekly/make_backup" ] && cp make_backup.sh /etc/cron.weekly/make_backup && sudo !!
  echo "the backup schedule has been set to run weekly"
  echo "the exact run time is in the /etc/crontab file" && exit $?
}

function perform_backup {
  readonly local backup_path=$(cat /backup_loc.conf)
  echo "starting backup..." > $LOG_LOC
  while read dir_path
  do 
     readonly local dir_name=$(basename $dir_path)
     readonly local filename=$backup_path$dir_name.tar.gz
     tar -zcf $filename $dir_path 2>> $LOG_LOC && chmod user:user $filename
     echo "backing up of $dir_name completed" 1>> $LOG_LOC
  done < /backup_dirs.conf
  echo "backup complete at:" >> $LOG_LOC && date >> $LOG_LOC
}

set -x
check_dir_loc && check_backup_loc && check_schedule && perform_backup
set +x
