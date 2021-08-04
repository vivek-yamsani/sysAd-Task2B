#!/bin/bash
fi=$1
se=$2

attendance='/home/jay_jay/attendance.txt'
 > $attendance
if [ "$fi" == "" ] 
then 
    date=$(date -I)
	    awk -F "[ ,]" '{ if($3 <= $date && !a[$3]++) print $3}' attendance.log > temp.txt

    declare -A abs
    while read i 
    do 
        for j in {"sysAd_","webDev_","appDev_"}
        do
            for k in {01..30}
            do 
                if  grep "$i" attendance.log | grep -q "$j$k" ;
                then :
                else
                    abs[$j$k]="${abs[$j$k]} $i"
                fi
            done 
        done 
    done  < temp.txt

    for i in "${!abs[@]}"
    do
        echo "$i - ${abs[$i]}"
    done > $attendance
else 

    awk -F "[ ,]" -v fi="$fi" -v se="$se" '{if($3 >= fi && $3 <= se && !a[$3]++) print $3}' attendance.log > temp.txt
    
    while read i 
    do 
        for j in {"sysAd_","webDev_","appDev_"}
        do
            
            for k in {01..30}
            do 
                if  grep "$i" attendance.log | grep -q "$j$k" ;
                then :
                else
                    if grep -q "$j$k" "$attendance";
                    then :
                    else
                        echo "$j$k" >> $attendance
                    fi
                fi
            done 
        done 
        
    done  < temp.txt
    
fi

rm temp.txt
