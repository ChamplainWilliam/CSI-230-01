#!/bin/bash

# script that displays home and IP address

# grep finds 'inet' then awk print 2 will just print the second field, which is the ip address.
ip addr | grep 'inet ' | awk '{print $2}'
