#! /bin/bash

active="/home/wchen/Desktop/CSI-230-01/Week4/ActiveHosts/activehosts.txt"

if  [ -f "webservers.txt" ];
then
   rm webservers.txt
fi

touch webservers.txt

while read -r line
do

   possible=$(curl --head -s --connect-timeout 2.37 "$line" | grep "200 OK")
   if [[ $possible > 1 ]];
   then
	echo "$line" >> webservers.txt
   fi
done < "$active"
