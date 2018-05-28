#!/bin/sh
apt_list="../config/apt.txt"
echo "apt update"
apt update
echo "apt upgrade"
apt upgrade

echo "Starting apt install"
cat ${apt_list} | while read line
do
  apt install ${line}
done
