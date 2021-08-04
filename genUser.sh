#!/bin/bash

for u in  {"sysAd_","webDev_","appDev_"}
do
	for i in {01..30}
	do 
		pass="$u$i@07"
		sudo useradd -m "$u$i"
		echo "$u$i:$pass" | sudo chpasswd 
	done

done

	sudo useradd -m "jay_jay"
	echo "jay_jay:jay_jay@07" | sudo chpasswd
