#!/bin/bash
# Clam AntiVirus script v1
# scans the system for malware

# checks if clamav is installed
freshclam --help 1>/dev/null 2>/dev/null
exitCode=$(echo $?)
if [[ $exitCode == "127" ]]; then
  echo "ClamAV is not installed, please wait while I install it..."
  ./scripts/installer.sh clamav
  exitCode=$(echo $?)
  if [[ $exitCode != "0" ]]; then
    echo "An error has occurred with the installation script, we are NOT continuing."
    exit 1
  fi
fi

# after the installation is complete, a scan begins.
echo "Performing a database update..."
freshclam
echo "Scanning the entire root system..."
clamscan -r / # performs a full recursive scan on the entire root system folder
zenity --info --title="ClamAV script" --width="300" --height="100" --text="The ClamAV script has completed. Please review the console for further details on the scan."
