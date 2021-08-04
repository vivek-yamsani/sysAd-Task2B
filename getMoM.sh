#!/bin/bash
#for column command
fir=$1
se=$2
if [ -z "$se" ]
then
    se=$(date -I)
fi

if [ -z "$fi" ]
then
        fir='2019-09-27'
fi

awk -F "[ ,]" -v fi="$fir" -v se="$se" '{if($3 >= fi && $3 <= se && !a[$3]++) print $3}' attendance.log > dates.txt

while read date
do
    lat="$(grep  "$date" "attendance.log" | awk -F "[ _]" '{if($2<=10) print $0}' | tail -n 1 | awk '{print $1}')"
    if [ -n "$lat" ]
    then
            echo "$lat|$date|$(cat /home/$lat/${date}_mom)"
    fi

done < dates.txt | column  -s "|" -t > /home/jay_jay/MoMs.txt 

rm dates.txt