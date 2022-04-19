#!/bin/sh

let "bad=1"

hosts="8.8.8.8 1.1.1.1 8.8.4.4 ukr.net"

for host in $hosts
do
    if [[ $bad -gt 0 ]] ; then
        if ping -q -c 3 -W 20 $host > /dev/null; then
            let "bad=0"
            logger "Ping $host OK."
        else
            let "bad+=1"
            logger "Ping $host failed."
        fi
    fi
done

if ! [[ $bad -gt 0 ]] ; then
    echo 1 > /sys/class/leds/green:adsl/brightness
    logger "Ping OK. Led ON. Script v3.0."
else
    echo 0 > /sys/class/leds/green:adsl/brightness
    logger "Ping BAD. Led OFF. Script v3.0."
fi