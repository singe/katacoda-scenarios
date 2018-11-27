#!/bin/sh
sleep 1
modprobe mac80211_hwsim
crontab -u root /tmp/crontab.tmp
rm -rf /tmp/crontab.tmp
/etc/init.d/cron start
curl -o /usr/local/share/sensepost.cap "https://wiki.wireshark.org/SampleCaptures?action=AttachFile&do=get&target=wpa-Induction.pcap"
