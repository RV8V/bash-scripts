#!/bin/bash
 
readonly RPT_DIR="/dist_usage"
readonly RPT_NAME="report.txt"
DIRS_TO_CHECH=

function show_help {
  [ "$1" = "--help" -o -z "$1" ] && {
    echo && echo "DISK USAGE" && echo "---------"
    echo "This script accepts 2 options:" && echo
    echo "-q to see a quick report" && echo "-r to produce a full report"
    echo && echo "Report are saved in $RPT_DIR" && exit 1
  }
}

function check_dir_list {
  [ ! $DIR_TO_CHECH ] && {
    echo "You need to specify directories to check by"
    echo "entering space separated paths in the DIRS_TO_CHECK"
    echo "variable at the top of this script" && exit 1
  }
}

function check_usage {
  case $1 in
    "-q") echo "System usage" && echo "---------"
	  df -h && echo
	  echo "Directory usage" && echo "---------"
	  for dir in $DIRS_TO_CHECK; do du -sh $dir; done ;;
    "-r") [ ! -d "$RPT_DIR" ] && mkdir $RPT_DIR
	  readonly local RPT_PATH=$RPT_DIR/$RPT_NAME
	  echo "disk usage report for directories: $DIRS_TO_CHECK" > $RPT_PATH
	  echo "------------------------------------" >> $RPT_PATH
	  for dir in $DIRS_TO_CHECK
	  do
	     : >> $RPT_PATH
	     echo "$dir directory" >> $RPT_PATH
	     echo "---------" >> $RPT_PATH
	     du -hc $dir >> $RPT_PATH
	  done
	  gedit $RPT_PATH ;;
       *) echo "Incorrect options were entered, see usage:" && show_help --help  ;;
  esac
}

set -x
show_help $1 && check_dir_list && check_usage $1
set +x
