dpkg -l aircrack-ng|grep -e ii -e un|grep ^ii > /dev/null 2> /dev/null
if [ $? == 0 ]; then
  echo done
else
  echo fail
fi
