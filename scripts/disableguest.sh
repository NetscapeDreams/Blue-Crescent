#!/bin/bash
# disables the guest account in debian/ubuntu systems

echo "allow-guest=false" >> /usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf

exitCode=$(echo $?)
if [[ $exitCode == "0" ]]; then
  zenity --info --title="Disable Guest Account Script" --text="Access to the guest account has been successfully disabled." --width="300" --height="100"
else
  zenity --error --title="Disable Guest Account Script" --text="An error has occurred. Check the console for details.\n\nExit code $exitCode" --width="200" --height="100"
fi
