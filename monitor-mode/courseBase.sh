#!/bin/sh
modprobe mac80211_hwsim
crontab -u root /tmp/crontab.tmp
rm -rf /tmp/crontab.tmp
/etc/init.d/cron start
touch /tmp/poo
