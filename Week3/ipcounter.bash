#! /bin/bash

echo "Enter ip address: "
read ip
echo "Enter subnet mask: "
read mask

ip1=$(echo "$ip" | cut -d'.' -f 1)
ip2=$(echo "$ip" | cut -d'.' -f 2)
ip3=$(echo "$ip" | cut -d'.' -f 3)
ip4=$(echo "$ip" | cut -d'.' -f 4)

ipbinary1=$(printf "%08d" "$(echo "obase=2; $ip1" | bc)")
ipbinary2=$(printf "%08d" "$(echo "obase=2; $ip2" | bc)")
ipbinary3=$(printf "%08d" "$(echo "obase=2; $ip3" | bc)")
ipbinary4=$(printf "%08d" "$(echo "obase=2; $ip4" | bc)")

fullipbin="${ipbinary1}${ipbinary2}${ipbinary3}${ipbinary4}"

maskbin=""

for ((i=1; i<33; i++));
   do
	if [[ ${mask} -ge ${i} ]];
	then
	   maskbin+="1"
	else
	   maskbin+="0"
	fi
   done

network=""

for ((i=0; i<32; i++));
   do
	if [[ "${fullipbin:$i:1}" == "1" && "${maskbin:$i:1}" == "1" ]];
	then
	   network+="1"
	else
	   network+="0"
	fi
   done

netfirst8="${network:0:8}"
netsecond8="${network:8:8}"
netthird8="${network:16:8}"
netfourth8="${network:24:8}"

netfirstdec=$((2#"${netfirst8}"))
netseconddec=$((2#"${netsecond8}"))
netthirddec=$((2#"${netthird8}"))
netfourthdec=$((2#"${netfourth8}"))

if [[ ${mask} == "24" ]]
then
   echo "All possible IP addresses in network" > output.txt
   i=0
   for (( i; i<256; i++ )); do
	if [[ ${i} == 0 || ${i} == 255 ]]
	then
	   continue
	fi
	echo "${netfirstdec}.${netseconddec}.${netthirddec}.${i}" >> output.txt
   done

fi

if [[ ${mask} == "16" ]]
then
   echo "All possible IP addresses in network" > output.txt
   i=0

   for (( i; i<256; i++ )); do
	j=0
	for (( j; j<256; j++ )); do

	   if [[ ${i} == 0 && ${j} == 0 || ${i} == 255 && ${j} == 255 ]]
	   then
		continue
	   fi

	   echo "${netfirstdec}.${netseconddec}.${i}.${j}" >> output.txt

	done

   done

fi
