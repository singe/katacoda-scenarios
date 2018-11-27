(( $(dpkg -l aircrack-ng|grep -e ii -e un|grep ^ii 2>/dev/null | wc -l) >= 1 )) && echo \"done\"
