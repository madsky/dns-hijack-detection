#!/bin/bash

#@leighhall 2014-12-22

cd "$(dirname $0)"

touch nomatch.txt
touch debug.txt

while read line; do
	sMatch=0
	surl=`echo $line | awk '{print $1}'`
	sip=`echo $line | awk '{print $2}'`
		
	echo Checking $surl 

	shost=`host $surl | awk '{print $4}' | egrep ^[0-9] -m 1`

	for i in $line #this loop caters for multiple IPs on one line
		do
		echo "Line:" $line "HOST:" $shost "(VALUE:"$i")" >> debug.txt
		if [ $shost = $i ]; then
			echo "Matched" >> debug.txt
			sMatch=1
			break
		fi
		done

	if [ $sMatch = 0 ]; then
		echo "No Match" >> debug.txt
		echo `date` "Possible DNS problem for this record. Expected: " $line " Got: ($shost)" >> nomatch.txt
		echo "                                   **NOMATCH**"
	fi
done <withIPs.txt

if [ -s nomatch.txt ]; then
	#file is NOT ZERO sized, therefore there might be problems
	echo Problems found
else
	echo No problems found
fi

DATE=$(date +"%Y%m%d%H%M")
mv debug.txt logs/$DATE.debug.log
mv nomatch.txt logs/$DATE.nomatch.log
