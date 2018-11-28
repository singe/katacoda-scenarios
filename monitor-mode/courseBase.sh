ssh root@[[HOST2_IP]] "echo foo > /tmp/foo"
ssh root@[[HOST_IP]] "modprobe mac80211_hwsim radios=1 \
  && crontab -u root /tmp/crontab.tmp \
  && rm -rf /tmp/crontab.tmp \
  && /etc/init.d/cron start \
  && curl -o /usr/local/share/sensepost.cap 'https://wiki.wireshark.org/SampleCaptures?action=AttachFile&do=get&target=wpa-Induction.pcap' \
  && apt-get install -y tcpreplay"
