#!/bin/bash
# disables logging in as the root user via tty

# find which line contains the root account (it usually is one, but it's here just in case)
grep -n root /etc/passwd > tmpFile
grepLine=$(cut -d: -f1 tmpFile)
rm tmpFile

# edit the line where the root account is
sed -i -e "${grepLine}s#/bin/bash#/usr/bin/nologin#" /etc/passwd

exitCode=$(echo $?)
if [[ $exitCode == "0" ]]; then
  yad --info --title="Disable Root Access Script" --text="Access to the root account via tty has been disabled." --width="300" --height="100"
else
  yad --error --title="Disable Root Access Script" --text="An error has occurred. Check the console for details.\n\nExit code $exitCode" --width="200" --height="100"
fi
