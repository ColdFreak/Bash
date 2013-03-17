#!/bin/bash

# output dashes or any other characters
# example
# ./dash.sh 
# ./dash.sh 500 
# ./dash.sh -c A
# ./dash.sh 500 -c A
function usagexit() {
	printf "usage: %s [ -c X ] [#]\n" $(basename $0)
	exit 2
}

LEN=72
CHAR='-'
while (( $# > 0 ))
do
	case $1 in
		[0-9]*) 
			LEN=$1
			;;
		
		-c) 
			shift
			CHAR=$1
			;;
		*) 
			usagexit
			;;
	esac
	shift
done

if (( LEN > 4096 ))
then
	echo "too large" >&2
	exit 3
fi

DASH=""
for (( i = 0; i < LEN; i++))
do
	DASH="${DASH}${CHAR}"
done
printf "%s\n" "${DASH}"


