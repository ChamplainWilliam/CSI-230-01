#! /bin/bash

logDir="/var/log/apache2/"

logFile="access.txt"

> $logFile

cd $logDir
cat access.log access.log.1 > $logFile

mv $logFile /home/wchen/Desktop/CSI-230-01/Week6/ReportOnAccessLog
