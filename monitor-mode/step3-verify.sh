ssh root@[[HOST_IP]] 'aircrack-ng -b 00:0C:41:82:B2:55 -w /etc/timezone ~/*.cap|grep "Passphrase not in dictionary" && echo done'
