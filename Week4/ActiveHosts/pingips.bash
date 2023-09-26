#! /bin/bash

echo "Active Hosts" > activehosts.txt
while read -r line
   do
   if ping -c 1 $line | grep -q "rtt" ;
   then
	echo "$line" >> activehosts.txt
   fi 
done < "possibleips.txt"
