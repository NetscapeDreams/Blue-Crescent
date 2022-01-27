#!/bin/bash
# enables the BPF (berkely packet finder) using sysctl.
# using sysctl requires root permissions.

zenity --question --text="This script will enable the Berkely Packet Finder, which is useful for running code in Linux kernel space to react to events such as function calls, function returns, and trace points in kernel or user space.\n\nDo you wish to continue?" --width="500" --height="100"
if [ $? = 1 ]; then
  exit 0
else
  sysctl kernel.unprivileged_bpf_disabled=1 1>/dev/null 2>/dev/null
  exitCode=$(echo $?)
  if [[ $exitCode == "0" ]]; then
    zenity --info --text="The Berkely Packet Finder has been enabled." --width="200" --height="100"
    exit 0
  else
    zenity --error --text="An error has occurred.\n\nSysctl exit code $exitCode" --width="200" --height="100"
    exit 123
  fi
fi
