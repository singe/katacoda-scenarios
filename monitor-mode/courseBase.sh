ssh root@[[HOST_IP]] "echo baz > /tmp/baz && \
touch /tmp/foo"
ssh root@[[HOST_IP]] "apt-get install -y tcpreplay"
ssh root@[[HOST_IP]] "modprobe mac80211_hwsim radios=1"
ssh root@[[HOST_IP]] "crontab -u root /tmp/crontab.tmp"
ssh root@[[HOST_IP]] "rm -rf /tmp/crontab.tmp"
ssh root@[[HOST_IP]] "/etc/init.d/cron start"
ssh root@[[HOST_IP]] "curl -o /usr/local/share/sensepost.cap 'https://wiki.wireshark.org/SampleCaptures?action=AttachFile&do=get&target=wpa-Induction.pcap'"
