#! /bin/bash

# reads access logs from /var/log/apache2/access.log



# cat /var/log/apache2/access.log | grep -o -E "[0-9]{1,2}\/[A-Za-z]{3}\/[0-9]{1,4}"


today=`date +"%d/%b/%Y"`

cat /var/log/apache2/access.log | grep "${today}" | grep -o -E "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" | sort | uniq -c


