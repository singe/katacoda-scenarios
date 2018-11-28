echo -e "\ec \u001b[32mPlease wait while we finish setting up your environment.\u001b[m"
while ((1)); do clear; which tcpreplay && break; sleep 1; done > /dev/null 2> /dev/null
while ((1)); do clear; iw dev wlan0 info && break; sleep 1; done > /dev/null 2> /dev/null
echo "All set up."
echo -e "\ec \u001b[32mYour Interactive Bash Terminal. A safe place to learn and execute commands.\u001b[m"
