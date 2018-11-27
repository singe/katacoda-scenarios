#!/bin/sh
sleep 1
modprobe mac80211_hwsim
crontab -u root /tmp/crontab.tmp
rm -rf /tmp/crontab.tmp
/etc/init.d/cron start
gunzip /usr/local/share/sensepost.cap.gz
