ssh root@[[HOST_IP]] "[ $(iw dev mon0 info|grep type|cut -dm -f2) == "onitor" ] || [ $(iw dev wlan0 info|grep type|cut -dm -f2) == "onitor"] && echo done"
