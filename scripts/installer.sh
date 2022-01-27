#!/bin/bash
# installer script for installing stuff.
# version 1.1.1
# - notifies the user where the file is stored

# checks if the current running user is root.
curUser=$(whoami)
if [[ $curUser != "root" ]]; then
  zenity --error --title="Installer Script" --width="200" --height="100" --text="You must run this script as root."
  exit 1
fi

# checks if the package-preference file exists, and asks the user for the system's package manager so it can remember it.
if [ -e "/root/package-preference" ]; then
  pkgman=$(cat /root/package-preference)
else
  pkgman=$(zenity --entry --title="Installer Script" --width="300" --height="100" --text="Please specify your package manager.")
  echo $pkgman > /root/package-preference
  zenity --info --title="Installer Script" --width="300" --height="100" --text="The script has noted your package manager, and stored it in /root/package-preference. If you need to change it, please delete, or edit the file."
fi

# installs the package using the given package manager.
case $pkgman in
  pacman)
    echo "Installing $1 using pacman..."
    pacman -S --noconfirm $1
    ;;
  apt)
    echo "Installing $1 using apt..."
    apt -y install $1
    ;;
  *)
    echo "This package manager is currently not supported, please install the package manually."
    ;;
esac
