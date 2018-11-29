ssh root@[[HOST_IP]] 'grep -i linksys ~/*|grep -v "<manuf>Cisco-Linksys</manuf>" && echo done'
