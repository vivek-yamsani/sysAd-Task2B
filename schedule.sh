#!/bin/bash
file="./future.txt"

var1=$(date -I)


var2=$(grep $var1 $file)
if [ -n "$var2" ]
then

	for j in {"appDev_","sysAd_","webDev_"}
	do

		for i in $(ls  /home | grep "$j")
		do

			cd /home/"$i"
			touch schedule.txt
			echo $var2 > schedule.txt
		done
	done

fi
		


