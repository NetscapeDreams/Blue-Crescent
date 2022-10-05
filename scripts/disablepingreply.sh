#!/bin/bash
# disables ICMP ping reply, making it harder to find devices on a network.

echo "1" > /proc/sys/net/ipv4/icmp_echo_ignore_all
exitCode=$(echo $?)
if [[ $exitCode == "0" ]]; then
  yad --info --title="ICMP Echo Script" --text="ICMP Echo Reply has been succesfully disabled." --width="300" --height="100"
else
  yad --error --title="ICMP Echo Script" --text="An error has occurred. Check the console for details.\n\nExit code $exitCode" --width="200" --height="100"
fi
