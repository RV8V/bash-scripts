#!/bin/bash
 
function fill_log() {
  [ -f "install.log" ] && tee -a install.log
  tee install.log  
}

function show_progress() {
  case $1 in
    "1") echo && echo 1. updating system ;;
    "2") echo && echo 2. uninstalling unwanted software ;;
    "3") echo && echo 3. install new software ;;
    "4") echo && echo 4. your system will now reboot ;;
    "5") exit $? ;;
  esac
}

function update_system() {
  apt update && sudo !! && apt -y upgrade 
}

function remove_software() {
  sudo apt -y purge `cat unistall.conf` && sudo apt autoremove
}

function install_software() {
  sudo apt -y install `cat install.conf`
}

rm "install.log" 2> /dev/zero && {
  show_progress 1 | fill_log
  update_system | fill_log
  show_progress 2 | fill_log
  [ -s "uninstall.conf" ] && remove_software | fill_log
  [ -f "uninstall.conf" ] && echo "no soft was selected to be removed" | fill_log
  echo "The uninstall.conf file will be created" | fill_log
  echo "make a space separated list of software to remove" | fill_log
  echo "save the blank file to remove no software" | fill_log
  echo "press Enter to continue" | fill_log
  read && vim uninstall.conf
  [ ! -s "uninstall.conf" ] || remove_software | fill_log
  echo "no software was selected to be removed" | fill_log

  show_progress 3 | fill_log
  [ -s "install.conf" ] && install_software | fill_log
  [ -f "install.conf" ] && echo "no new soft was selected to be installed" | fill_log
  echo "The install.conf file will be created" | fill_log
  echo "make a space separated list of software to install" | fill_log
  echo "save the blank file to install no software" | fill_log
  echo "press Enter to continue" | fill_log
  read && vim install.conf
  [ ! -s "install.conf" ] || install_software | fill_log
  echo "no new software was selected to be installed" | fill_log

  show_progress 4 | fill_log
  systemctl reboot && sudo !!
}
