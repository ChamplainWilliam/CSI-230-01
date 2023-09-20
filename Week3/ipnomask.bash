#! /bin/bash

# gets ip address from myfullip.bash as x.x.x.x/x
# returns x.x.x.x

ip=$(bash myfullip.bash | cut -d'/' -f 1 )
echo "${ip}"
