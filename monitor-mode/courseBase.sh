modprobe mac80211_hwsim
crontab -u root /opt/sensepost/crontab.tmp
rm -rf /opt/sensepost/crontab.tmp
/etc/init.d/cron start
