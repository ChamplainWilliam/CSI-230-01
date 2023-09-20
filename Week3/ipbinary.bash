#! /bin/bash



myip1=$(bash myfullip.bash | cut -d'.' -f 1)
myip2=$(bash myfullip.bash | cut -d'.' -f 2)
myip3=$(bash myfullip.bash | cut -d'.' -f 3)
myip4=$(bash myfullip.bash | cut -d'.' -f 4 | cut -d'/' -f 1 )

ip1binary=$(echo "obase=2;$myip1" | bc)
ip2binary=$(echo "obase=2;$myip2" | bc)
ip3binary=$(echo "obase=2;$myip3" | bc)
ip4binary=$(echo "obase=2;$myip4" | bc)

echo "${ip1binary}${ip2binary}${ip3binary}${ip4binary}"
