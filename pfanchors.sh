#!/bin/ksh

version="0.1"
usage="pfanchors [show|load|flush] anchor
                 [list]"

# We defined a valid list of anchors
anchors=`pfctl -a '*' -sr | grep anchor | cut -d'"' -f2 | tr '\n' ' '`
set -A anchorlist $anchors

if [ ! $1 ]; then
	echo $usage
	exit 0
fi

# Arg 1
case $1 in
	show)
	show="YES"
	;;
	load)
	load="YES"
	;;
	flush)
	flush="YES"
	;;
	list)
	list="YES"
	;;
	help)
	echo $usage
	exit 0
	;;
	version)
	echo "pfanchors $version"
	exit 0
	;;
	*)
	echo "error: unkown argument $1"
	echo $usage
	exit 1
	;;
esac

anchor="$2"

# Processing
if [ $show ]; then
	echo "showing active rules for anchor $anchor:"
	pfctl -a $anchor -s rules
elif [ $load ]; then
	listCount=0
	listLenght=${#anchorlist[@]}
	while [ $listCount -lt $listLenght ]
	do
		if [ ${anchorlist[$listCount]} == $anchor ]; then
			pfctl -a $anchor -f "/etc/pf/pf-${anchor}.conf"
			loaded=1
			break
		fi
		listCount=$listCount+1
	done	
	if [ ! $loaded ]; then
		echo "error: no anchor named $anchor"
		exit 1
	fi
elif [ $flush ]; then
	pfctl -a $anchor -F rules
elif [ $list ]; then
	listCount=0
	listLenght=${#anchorlist[@]}
	while [ $listCount -lt $listLenght ]
	do
		printf "Anchor %s: " "${anchorlist[$listCount]}"
		rules=`pfctl -a ${anchorlist[$listCount]} -sr`
		if [[ -n $rules ]]; then
			printf '%s\n' 'active'
		else
			printf '%s\n' 'inactive'
		fi
		listCount=$listCount+1
	done	
fi


exit 0
