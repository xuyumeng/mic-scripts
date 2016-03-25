#!/bin/bash

PINGRET=$( ping -c 4 baidu.com | grep "ttl" )
#echo $PINGRET

if [ -z "$PINGRET" ]&&[ -z "$PINGRET" ];then
	echo "no network connection"
	systemctl restart network
	exit 1;
else
    echo "test network successfully"
    exit 0;
fi
