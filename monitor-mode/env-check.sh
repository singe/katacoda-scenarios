while ((1)); do echo -e "\ec \u001b[32mPlease wait while we finish setting up your environment.\u001b[m"; which tcpreplay && break; sleep 1; done 2> /dev/null
while ((1)); do echo -e "\ec \u001b[32mPlease wait while we finish setting up your environment.\u001b[m"; iw dev wlan0 info && break; sleep 1; done 2> /dev/null
echo -e "\ec \u001b[32mYour Interactive Bash Terminal. A safe place to learn and execute commands.\u001b[m"
