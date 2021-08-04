#!/bin/bash
var=10
v1=3yr
v2=4yr
for u in  {"sysAd_","webDev_","appDev_"}
do

sudo groupadd "$u$v1"
sudo groupadd "$u$v2"

	for i in {11..20}
	do 
	
		sudo usermod -aG "$u$v1" "$u$i"
	
	done
	
	for i in {21..30}
	do 
	
		sudo usermod -aG "$u$v2" "$u$i"
	
	done
	
	#giving permissions to 0-9 home dir for 3&4 year students &jay
	v3=0
	for x in {1..9}
	do
		sudo setfacl -m g:"$u$v1":r-- /home/"$u$v3$x"
		sudo setfacl -m g:"$u$v2":r-- /home/"$u$v3$x"
		sudo setfacl -m u:jay_jay:r-x /home/"$u$v3$x"
	done
	
	#giving permission to 10 home dir for 3&4 year stu &jay
	
	sudo setfacl -m g:"$u$v1":r-- /home/"$u$var"
	sudo setfacl -m g:"$u$v2":r-- /home/"$u$var"
	sudo setfacl -m u:jay_jay:r-x /home/"$u$var"
	
	#giving permission to 11-20 home dir for 4year and jay
	for x in {11..20}
	do
		sudo setfacl -m g:"$u$v2":r-- /home/"$u$x"
		sudo setfacl -m u:jay_jay:r-- /home/"$u$x"
		sudo setfacl -m g:"$u$v1":--- /home/"$u$x"	
	done
	
	#giving permissions to 21-30 home dir for jay
	for x in {21..30}
	do
		sudo setfacl -m u:jay_jay:r-- /home/"$u$x"
		sudo setfacl -m g:"$u$v2":--- /home/"$u$x"
	done
	
	sudo chmod o=--- /home/s* /home/w* /home/a* /home/jay_jay
done

