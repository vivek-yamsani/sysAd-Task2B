#!/bin/bash

awk -F "[ ,]" '{if(!a[$3]++) print $3}' attendance.log > dates.txt

while read date
do
    lat="$(grep  "$date" "attendance.log" | awk -F "[ _]" '{if($2<=10) print $0}' | tail -n 1 | awk '{print $1}')"
    if [ -n "$lat" ]
    then 
        echo "this is the MoM of the meet dated on $date" > /home/$lat/${date}_mom
        setfacl -m u:jay_jay:r-- "/home/$lat/${date}_mom"
    fi

done < dates.txt 

rm dates.txt