#! /bin/bash

# gives subnet mask in binary

mask=$(bash ipmask.bash)

submask=""

for ((i=1; i<33;i++));
   do
	if [[ ${mask} -ge ${i} ]];
	then
	   submask+="1"
	else
	   submask+="0"
	fi
   done
echo "${submask}"
