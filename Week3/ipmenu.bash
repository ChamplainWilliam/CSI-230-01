#! /bin/bash

echo "Hello Network Fellow"

input=0
while [ ${input} != "6" ]
do
   echo -e "\nPlease select an option: "
   echo "1-Get my ip address"
   echo "2-Get my ip address in binary"
   echo "3-Get my network mask in binary"
   echo "4-Get my network address inbinary"
   echo "5-Convert a binary to IP address"
   echo "6-Quit"

   read input

if [[ ${input} < 1 || ${input} > 6 ]]
then
   echo "Please enter a valid number from the list presented."
fi

if [[ ${input} == "1" ]]
then
   bash myfullip.bash
fi

if [[ ${input} == "2" ]]
then
   bash ipbinary.bash
fi

if [[ ${input} == "3" ]]
then
   bash mymaskbinary.bash
fi

if [[ ${input} == "4" ]]
then
   bash mynetworkbinary.bash
fi

if [[ ${input} == "5" ]]
then
   bash binaryip2decimal.bash
fi


done

