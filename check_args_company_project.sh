#!/bin/sh


check_args_company_project () {
	echo "params $#"
	echo "check args $1 $2"

	if [ -z "$1" ]
	  then
	    echo "No 1st argument COMPANY_NAME"
	    echo "Usage: $0 COMPANY_NAME PROJECT_NAME"
	    return false
	fi

	if [ -z "$2" ]
	  then
	    echo "No 2nd argument PROJECT_NAME"
	    echo "Usage: $0 COMPANY_NAME PROJECT_NAME"
	    return false
	fi

    return true
}


#if [ $# -ne 2 ]; then
#   usage;
#fi

#if [ "$1" != "-t" ]; then
#    echo "No -t param for for 1st arg"
#fi

