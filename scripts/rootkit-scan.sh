#!/bin/bash
# rootkit scanner v1
# root required
# this script utilizes RootkitHunter, and scans for possible rootkits within the system.

# check if rkhunter is installed
rkhunter 1>/dev/null 2>/dev/null
exitCode=$(echo $?)
if [[ $exitCode == 127 ]]; then
  echo "Rootkit Hunter is not installed, please wait while I install it."
  ./scripts/installer.sh rkhunter
  exitCode=$(echo $?)
  if [[ $exitCode != "0" ]]; then
    echo "An error has occurred with the installation script, we are NOT continuing."
    exit 1
  fi
elif [[ $exitCode == 126 ]]; then
  echo "Rootkit Hunter cannot be accessed."
  exit 1
fi
echo "Rootkit Hunter has been successfully found, please wait while a scan is launched."
rkhunter -c
echo "Script completed, please read the log above."
