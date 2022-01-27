#!/bin/bash
# installs and enables the uncomplicated firewall.

# checks if UFW is installed.
uw --help 1>/dev/null 2>/dev/null
exitCode=$(echo $?)
if [[ $exitCode == "127" ]]; then
  echo "UFW is not installed, please wait while I install it..."
  ./scripts/installer.sh ufw
  exitCode=$(echo $?)
  if [[ $exitCode != "0" ]]; then
    echo "An error has occurred with the installation script, we are NOT continuing."
    exit 1
  fi
fi

echo "UFW has been detected, please wait while I enable it."

# enables the firewall and turns on logging.
ufw enable
ufw logging on
ufw logging high
ufw status verbose
