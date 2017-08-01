#!/bin/sh
echo "params $#"
#if [ $# -ne 2 ]; then
#   usage;
#fi

#if [ "$1" != "-t" ]; then
#    echo "No -t param for for 1st arg"
#fi

if [ -z "$1" ]
  then
    echo "No 1st argument COMPANY_NAME"
    echo "Usage: $0 COMPANY_NAME PROJECT_NAME"
    exit 1
fi

if [ -z "$2" ]
  then
    echo "No 2nd argument PROJECT_NAME"
    echo "Usage: $0 COMPANY_NAME PROJECT_NAME"
    exit 1
fi
