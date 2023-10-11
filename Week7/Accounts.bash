#! /bin/bash

function Help()
{
echo "--------------------------------"
echo "Syntax: ./$0 [- d/c]"
echo "Options:"
echo "d   List disabled accounts"
echo "c   Count logins of a user"
echo "--------------------------------"
}
if [[ ! ${#} -eq 1 ]]; then
Help
exit;
fi

while getopts ":dc" option; do
   case $option in
     d)
	echo "Disabled Accounts: "
	tail  /etc/shadow | grep "*" | cut -d':' -f 1
	;;
     c)
	echo "Number of logins"
	while read -r line;
	   do
	   last | grep -o "$line" | sort | uniq -c
	done < "user.txt"
	;;
   esac
done
