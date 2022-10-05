#!/bin/bash
# enforces system memory randomization

echo "kernel.randomize_va_space = 2" > /etc/sysctl.d/01-enable-aslr.conf
exitCode=$(echo $?)
if [[ $exitCode == "0" ]]; then
  yad --info --title="Memory Randomization Script" --text="Memory Randomization has been successfully enabled." --width="300" --height="100"
else
  yad --error --title="Memory Randomization Script" --text="An error has occurred.\n\nSysctl exit code $exitCode" --width="200" --height="100"
fi
