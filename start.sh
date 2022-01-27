#!/bin/bash

# Essentiality Script, written by BurningInfern0 for use in hardening Linux system environments.

if [[ $1 == "--graphical" ]]; then
  curUser=$(whoami)
  if [[ $curUser != "root" ]]; then
    zenity --info --title="Essentiality Script" --width="300" --height="100" --text="This script has not been run as root. The script will continue, but please expect errors when running as a non-root user."
  fi
  scriptOptions=$(zenity --list --title="Essentiality Script, Graphical" --text="Please select what you want to do.\n\nEssentiality Script v0.2, Installer script is version 1.1.1.\n\nProgram and scripts written by BurningInfern0." --width="550" --height="410" --checklist --column="Check" --column="Script" --column="Description" --column="Version" \
    . ForkBombs "Prevents fork bombs." 1.1 \
    . RKHunter "Performs a rootkit scan with RootkitHunter." 1.0 \
    . BPF "Enables the Berkely Packet Finder." 1.0 \
    . RandMem "Enables Memory Randomization." 1.0 \
    . UFW "Enables the Uncomplicated Firewall." 1.0 \
    . ClamAV "Performs a malware scan with ClamAV." 1.0 \
    . ICMPEcho "Disables the ICMP Echo Reply function." 1.0 \
    . DisRoot "Disables root access via tty." 1.0 \
    . DisSSHRoot "Disables root access via SSH." 1.0 \
    . DisGuest "Disables the guest account in Debian/Ubuntu systems." 1.0 \
    . HideProcID "Hides account process IDs via /etc/fstab." 1.0)

  # puts zenity items into array
  IFS="|" read -ra scriptItems <<< "$scriptOptions"

  for script in ${scriptItems[@]}; do
    case $script in
      ForkBombs)
        ./scripts/forkbombs.sh
        ;;
      RKHunter)
        ./scripts/rootkit-scan.sh
        ;;
      BPF)
        ./scripts/berkelypacketfinder.sh
        ;;
      RandMem)
        ./scripts/memoryrandomization.sh
        ;;
      UFW)
        ./scripts/ufw.sh
        ;;
      ClamAV)
        ./scripts/clamav.sh
        ;;
      ICMPEcho)
        ./scripts/disablepingreply.sh
        ;;
      DisRoot)
        ./scripts/disablerootaccess.sh
        ;;
      DisSSHRoot)
        ./scripts/disablesshrootaccess.sh
        ;;
      DisGuest)
        ./scripts/disableguest.sh
        ;;
      HideProcID)
        ./scripts/hideprocid.sh
        ;;
    esac
  done
  exit 0
  fi
if [[ $1 == "--command" ]]; then
  echo "command line mode is currently not complete at this time, please use graphical mode."
  exit 0
fi
echo -e "usage: ./start.sh [MODE]\nModes:\n--graphical    enables the graphical interface.\n--command      enables the command interface."
