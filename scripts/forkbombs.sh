#!/bin/bash
# forkbomb prevention script v1.1
# - made the option to actually close the script
# this script should be run as root.
# this script prevents system forkbombs by turning down the number of allowed running processes.

username=$(zenity --entry --title="Forkbomb Prevention Script" --width="300" --height="100" --text="Please enter the username of who you want to modify." --entry-text="Enter a username here.")
if [ $? = 1 ]; then
  exit 0
else
  forkbombNum=$(zenity --entry --title="Forkbomb Prevention Script" --width="400" --height="100" --text="Please specify a number for setting the limit of the allowed numbers of running processes under your account. This number should at least be above ~200." --entry-text="Enter a number here.")
  if [ $? = 1 ]; then
    exit 0
  else
    forkbombEntry=$(echo -e "$username\thard\tnproc\t$forkbombNum")
    echo -e $forkbombEntry >> /etc/security/limits.conf
  fi
fi
