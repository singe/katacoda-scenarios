echo "Please wait while we finish setting up your environment."
while ((1)); do which tcpreplay && break; sleep 1; done > /dev/null
while ((1)); do iw dev wlan0 info && break; sleep 1; done > /dev/null
echo "All set up."
clear
