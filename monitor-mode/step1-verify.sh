#!/bin/sh
dpkg -l aircrack-ng|grep -e ii -e un|grep ^ii > /dev/null
if [ $? == 0 ]; then
  echo done
else
  echo fail
fi
