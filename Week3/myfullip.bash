#!/bin/bash

# script that displays full IP address

# grep finds 'inet' then 'brd'. awk print 2 will just print the second field, which is the ip address.
ip addr | grep 'inet ' | grep 'brd' | awk '{print $2}'
