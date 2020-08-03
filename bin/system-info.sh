#!/bin/bash
 
readonly red_on="\033[0;31"
readonly red_0ff="\033[0m"

function show_interface() {
  clear && echo "This is a System Information Tool. Please choose an option:" && echo
  echo -e "\t 1. Show Linux Kernal Version"
  echo -e "\t 2. Show Version of Ubuntu"
  echo -e "\t 3. Show hostname of this system"
  echo -e "\t 4. Show list off all users"
  echo -e "\t 5. Quit"
  read readonly chosen_option
  get_option_results
}
show_interface

function get_option_results() {
  case $chosen_option in
    "1") echo $red_on `uname -r` $red_off ;;
    "2") echo $red_on `cat /etc/os-release` $red_off ;;
    "3") echo $red_on `hostname` $red_off ;;
    "4") echo $red_on `grep /bin/bash /etc/passwd | cut -d: -f1 | xargs` $red_off ;;
    "5") clear && exit $? ;;
  esac
  show_interface
}
