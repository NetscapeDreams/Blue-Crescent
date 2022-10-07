#!/bin/bash

if [[ $1 == "-g" ]]; then
  yad --splash --center --image="./assets/bcsplash.png" --no-buttons --width=800 --height=500
  curUser=$(whoami)
  if [[ $curUser != "root" ]]; then
    yad --title="Blue Crescent | Root Warning" --window-icon="./assets/bcicon.png" --width=500 --text="This script has not been run as root. Non-root mode should only be used for development or debugging purposes only."
    if [[ $? == "1" ]]; then
      exit
    fi
  fi
  scriptOptions=$(yad --list --center --window-icon="./assets/bcicon.png" --image="./assets/bc.png" --image-on-top --title="Blue Crescent Graphical" --text="Please select what you want to do.\n\nBlue Crescent v0.2.1-rc3, Installer script is version 1.2.1.\n\nProgram and scripts written by BurningInfern0." --width="700" --height="500" --checklist --column="Check" --column="Script" --column="Description" --column="Version" --column="External" \
    false ForkBombs "Prevents fork bombs." 1.1 "" \
    false RKHunter "Performs a rootkit scan with RootkitHunter." 1.0 "rkhunter" \
    false BPF "Enables the Berkely Packet Finder." 1.0 "" \
    false RandMem "Enables Memory Randomization." 1.0 "" \
    false UFW "Enables the Uncomplicated Firewall." 1.0 "ufw" \
    false ClamAV "Performs a malware scan with ClamAV." 1.0 "clamav" \
    false ICMPEcho "Disables the ICMP Echo Reply function." 1.0 "" \
    false DisRoot "Disables root access via tty." 1.0 "" \
    false DisSSHRoot "Disables root access via SSH." 1.0 "openssh-server" \
    false DisGuest "Disables the guest account in Debian/Ubuntu systems." 1.0 "" \
    false Cron "Gathers information about currently installed crontabs." 1.0 "" \
    false Symlinks "Removes broken symlinks." 1.0 "symlinks")

  # puts yad items into array
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
      Cron)
        ./scripts/cron.sh
        ;;
      Symlinks)
        ./scripts/symlinks.sh
        ;;
    esac
  done
  exit 0
  fi
if [[ $1 == "-c" ]]; then
  echo "command line mode is currently not complete at this time, please use graphical mode."
  exit 0
fi
echo -e "usage: ./start.sh [MODE]\nModes:\n-g    enables the graphical interface.\n-c    enables the command interface."
