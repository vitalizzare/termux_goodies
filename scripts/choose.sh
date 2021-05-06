#!/bin/sh
[ $# -ne 0 ] || return
if [ "$1" = '-t' ]
then
    shift
    [ $# -gt 1 ] && TITLE="$1" || return
    shift
fi
IFS=,
termux-dialog radio -t "$TITLE" -v "$*"|\
sed -n '/index/s/[^0-9]//gp'
