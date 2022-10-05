#!/bin/bash
# installer script for installing stuff.
# version 1.2.1
# - updated error detection

if [[ -n "$1" ]]; then
  echo ""
else
  echo -e "Blue Crescent Installer Script v1.2\nusage: ./installer.sh [PACKAGE]\nMust be run as root."
  exit
fi

# checks if the current running user is root.
curUser=$(whoami)
if [[ $curUser != "root" ]]; then
  yad --title="Installer Script" --width="300" --height="100" --text="You must run this script as root."
  exit 1
fi

# checks if the package-preference file exists, and asks the user for the system's package manager so it can remember it.
if [ -e "/root/package-preference" ]; then
  pkgman=$(cat /root/package-preference)
else
  pkgmanOptions=$(yad --list --center --title="Select Package Manager" --text="Please select your package manager.\nIf your package manager is not in this list, you'll have to install it via your package manager manually, or compile it." --width="375" --height="250" --checklist --column="Check" --column="Manager" --column="System"\
  false yum "Red Hat Enterprise Linux-based" \
  false dnf "Fedora-based" \
  false zypper "OpenSUSE-based" \
  false pacman "Arch Linux-based" \
  false apt "Debian-based")

  # puts yad items into array
  IFS="|" read -ra pkgmanItems <<< "$pkgmanOptions"

  echo $pkgmanOptions | cut -d"|" -f2 | tee /root/package-preference

  yad --title="Installer Script" --width="300" --height="100" --text="The script has noted your package manager, and stored it in /root/package-preference. If you need to change it, please delete, or edit the file."
fi

# installs the package using the given package manager.
case $pkgman in
  yum)
    echo "Installing $1 via yum..."
    yum -y install $1
    exitCode=$(echo $?)
    if [[ $exitCode != "0" ]]; then
      exit 1
    fi
    ;;
  dnf)
    echo "Installing $1 via dnf..."
    dnf install --assumeyes $1
    exitCode=$(echo $?)
    if [[ $exitCode != "0" ]]; then
      exit 1
    fi
    ;;
  zypper)
    echo "Installing $1 via zypper..."
    zypper --no-confirmation install $1
    exitCode=$(echo $?)
    if [[ $exitCode != "0" ]]; then
      exit 1
    fi
    ;;
  pacman)
    echo "Installing $1 via pacman..."
    pacman -S --noconfirm $1
    exitCode=$(echo $?)
    if [[ $exitCode != "0" ]]; then
      exit 1
    fi
    ;;
  apt)
    echo "Installing $1 via apt..."
    apt -y install $1
    exitCode=$(echo $?)
    if [[ $exitCode != "0" ]]; then
      exit 1
    fi
    ;;
esac 

