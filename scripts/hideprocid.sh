#!/bin/bash
# hides account process ids

echo -e "\n# /proc is remounted to hide process ids" >> /etc/fstab
echo "proc    /proc    proc    defaults,hidepid=2    0 0" >> /etc/fstab

exitCode=$(echo $?)
if [[ $exitCode == "0" ]]; then
  yad --info --title="Hide Process ID Script" --text="This script has completed successfully.\nA restart is required for changes to take effect." --width="300" --height="100"
else
  yad --error --title="Hide Process ID Script" --text="An error has occurred. Check the console for details.\n\nExit code $exitCode" --width="200" --height="100"
fi
