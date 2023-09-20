#! /bin/bash

# gets ip address from myfullip.bash as x.x.x.x/x
# returns /x

ip=$(bash myfullip.bash | cut -d'/' -f 2 )
echo "${ip}"
