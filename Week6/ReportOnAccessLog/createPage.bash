#! /bin/bash

> "newPage.html"

echo "<html>" >> "newPage.html"
echo "<body>" >> "newPage.html"
echo "<table>" >> "newPage.html"
echo "<tr>" >> "newPage.html"
while read -r line; do
   IP=$(echo $line | cut -d'-' -f 1 )
   Time=$(echo "$line" | cut -d' ' -f 4 | tr -d '[]"' )
   RequestedPage=$(echo $line | cut -d' ' -f 7)
   UserAgent=$(echo $line | cut -d' ' -f 12 | grep "Mozilla")
   echo "<tr><td>$IP</td> <td>$Time</td> <td>$RequestedPage</td> <td>$UserAgent</td></tr>" >> "newPage.html"
done < "access.txt"
echo "</tr>" >> "newPage.html"
echo "</table>" >> "newPage.html"
echo "</body>" >> "newPage.html"
echo "</html>" >> "newPage.html"

cp "newPage.html" /var/www/html
