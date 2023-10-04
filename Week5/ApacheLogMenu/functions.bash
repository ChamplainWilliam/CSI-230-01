#! /bin/bash

function listIPs ()
{


pFile="clientIPs.txt"

if [[ -f "${pFile}" ]]
then
   rm $pFile
fi
touch $pFile

p=$(cat access.log | grep -o -E "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" | sort | uniq )
echo "$p" >> clientIPs.txt
}

#listIPs

function visitors ()
{

today=$(date +"%d/%b/%Y")

f=$(cat access.log | grep "${today}"  | grep -o -E "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" | sort | uniq -c )
echo "$f"
}

#visitors

function badClients ()
{

rm "blacklisted.txt"
touch "blacklisted.txt"



currentHour=$(date "+%H")


while read -r line;

   do
   count=0


   while read -r line2;
	do

	lineadr=$(echo "$line2" | awk '{print $1}' )
	accessHour=$(echo "$line2" |  egrep 'HTTP/.*" 40[0-4]' | cut -d' ' -f 4 | tr -d '[]"' | cut -d':' -f 2 )

#	if [[ $accessHour == $currentHour ]];
#	then

	   if [[ $lineadr == $line ]];
	   then

		ipcount=$(echo "$line2" | egrep -o  'HTTP/.*" 40[0-4]' | egrep -o '40[0-4]')

		if [[ -n "$ipcount" ]];
		then
		   ((count=count+1))
	   	fi
	   fi
#	fi
   done < "access.log"


   if [[ $count -gt 3 ]];
   then
	echo $line >> blacklisted.txt
   fi

done < "clientIPs.txt"
}
# badClients

function histogram ()
{

count=0
while read -r line
   do

   count200=$(echo "$line" | egrep -o 'HTTP/.*" 200')
   accessDate=$(echo "$line" | cut -d' ' -f 4 | tr -d '[]"' | cut -d':' -f 1)

   if [[ -n "$count200" ]];
   then
	((count=count+1))
   fi

   done < "access.log"

echo "$count visits in $accessDate"

}

function block ()
{

while read -r blockIPs
   do

   sudo iptables -A INPUT -s "$blockIPs" -j DROP
   echo "blocked $blockIPs"

done < "blacklisted.txt"

}

function resetBlocks ()
{

sudo iptables -F INPUT

}

function menu ()
{

cd /var/log/apache2
sudo cp access.log /home/wchen/Desktop/CSI-230-01/Week5/ApacheLogMenu
cd /home/wchen/Desktop/CSI-230-01/Week5/ApacheLogMenu


input=0
while [ ${input} != "7" ]
do

   echo "[1]Number of Visitors"
   echo "[2]Display Visitors"
   echo "[3]Show Bad Visits"
   echo "[4]Block Bad Visits"
   echo "[5]Reset Block Rules"
   echo "[6]Show Visit Histogram"
   echo "[7]Quit"

   read input

   if [[ ${input} < 1 || ${input} > 7 ]]
   then
	echo "Please enter a valid number from the list presented."
   fi

   if [[ ${input} == "1" ]]
   then
	listIPs
	echo "IPs stored in clientIPs.txt"
   fi

   if [[ ${input} == "2" ]]
   then
	echo "Visitors"
	visitors
   fi

   if [[ ${input} == "3" ]]
   then
	badClients
	echo "Bad clients stored in blacklisted.txt"
   fi

   if [[ ${input} == "4" ]]
   then
	block
	echo "IPs from blacklisted.txt are now blocked"
   fi

   if [[ ${input} == "5" ]]
   then
	resetBlocks
	echo "Blocked IPs are now reset"
   fi

   if [[ ${input} == "6" ]]
   then
	histogram
   fi

done

}

menu
