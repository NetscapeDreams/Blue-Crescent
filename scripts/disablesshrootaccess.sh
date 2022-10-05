#!/bin/bash
# disables root access via ssh

lineNumber=$(grep -n PermitRootLogin /etc/ssh/sshd_config > tmpFile)
grepLine=$(sed "/setting/d" tmpFile | awk -F ":" '{print $1}')
rm tmpFile

sed -i "${grepLine}s/.*PermitRootLogin .*/PermitRootLogin no/" /etc/ssh/sshd_config
systemctl restart sshd

exitCode=$(echo $?)
if [[ $exitCode == "0" ]]; then
  yad --info --title="Disable SSH Root Access Script" --text="Access to the root account via SSH has been disabled." --width="300" --height="100"
else
  yad --error --title="Disable SSH Root Access Script" --text="An error has occurred. Check the console for details.\n\nExit code $exitCode" --width="200" --height="100"
fi
