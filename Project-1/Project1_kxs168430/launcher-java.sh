#!/bin/bash


# Change this to your netid
netid=kxs168430


# Root directory of your project
PROJDIR=$HOME/proj1

CONFIG=$PROJDIR/config.txt

#
# Directory your java classes are in
#
BINDIR=$PROJDIR/nnodeprogram

#
# Your main project class
#
PROG=NNodeProgram


cat $CONFIG | sed -e "s/#.*//" | sed -e "/^\s*$/d" | grep "\s*[0-9]\+\s*\w\+.*" |
(
    while read line 
    do

	n=$( echo $line | awk '{ print $1 }' )
	host=$( echo $line | awk '{ print $2 }' )
		
	
        ssh -o StrictHostKeyChecking=no $netid@$host java -cp $BINDIR $PROG $n &
    done
)



