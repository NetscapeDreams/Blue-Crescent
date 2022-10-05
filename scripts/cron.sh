# crontab detection script

# known crontab locations
echo -e "// spool crontabs //\n" >> ./crontabs.log
ls -la /var/spool/cron/crontabs/ &>> ./crontabs.log
echo -e "\n// etc cron.d //\n" >> ./crontabs.log
ls -la /etc/cron.d/ &>> ./crontabs.log
echo -e "\n// crontab file //\n" >> ./crontabs.log
cat /etc/crontab &>> ./crontabs.log
echo -e "\n// hourly cron jobs //\n" >> ./crontabs.log
ls -la /etc/cron.hourly &>> ./crontabs.log
echo -e "\n// daily cron jobs //\n" >> ./crontabs.log
ls -la /etc/cron.daily &>> ./crontabs.log
echo -e "\n// weekly cron jobs //\n" >> ./crontabs.log
ls -la /etc/cron.weekly &>> ./crontabs.log
echo -e "\n// monthly cron jobs //\n" >> ./crontabs.log
ls -la /etc/cron.monthly &>> ./crontabs.log

yad --width="500" --height="100" --title="Blue Crescent | Crontabs" --text="The script has successfully finished, and a log file has been generated under your current directory. Look for 'crontabs.log'." --button=OK:0