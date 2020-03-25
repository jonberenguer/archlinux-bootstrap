#!/bin/bash

rfkill unblock `rfkill list all | grep Wireless | cut -c1-1`
rfkill list wifi

if [ "$1" = "" ] ; then
  echo "no wifi network selected"
  exit
fi

WIFIDB=/root/wifi/wifi-history.txt

#grep ${1} wifi-history.txt | awk '{  system("wpa_supplicant -B -i wlp2s0 -c <(wpa_passphrase \"" $1 "\" \"" $2 "\")" ) }'
ESSID=`grep ${1} ${WIFIDB} | awk '{ print $1 }'`
KEY=`grep ${1} ${WIFIDB} | awk '{ print $2 }'`

wpa_supplicant -B -i wlp2s0 -c <(wpa_passphrase $ESSID $KEY)

dhcpcd wlp2s0

