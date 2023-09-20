#! /bin/bash

# accesses 192.168.3.147 20 times

i=0
for (( i; i<20; i++ )); do
   curl -s 192.168.3.147/helloworld.html > /dev/null
done
echo "Accessed ${i} times"
