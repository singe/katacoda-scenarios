The other SSID is `linksys`. You can find it with the command:
`tshark -i mon0 -T fields -e wlan.ssid -Y 'wlan.ssid != Coherer'`{{execute}}

You can write it to the `ssid` file with:
`echo linksys > ssid`{{execute}}
