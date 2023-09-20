#! /bin/bash

# Gives network address in binary

ip=$(bash ipbinary.bash)
mask=$(bash mymaskbinary.bash)

network=""

for ((i=0; i<32; i++));
   do 
	if [[ "${ip:$i:1}" == "1" && "${mask:$i:1}" == "1" ]];
	then
	   network+="1"
	else
	   network+="0"
	fi
   done
echo "${network}"
