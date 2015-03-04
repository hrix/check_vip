#!/bin/sh

OK=0
WARNING=1
CRITICAL=2
UNKNOWN=3

ACTIVE_HOSTNAME=$1
STANDBY_HOSTNAME=$2
VIP=$3

RESULT=`ip a|grep " inet ${VIP}/"`
HOSTNAME=`hostname`

if [ -n "$RESULT" ]; then
  if [ $HOSTNAME = $ACTIVE_HOSTNAME ]; then
    echo "YES! VIP up & I'm ACTIVE" && exit $OK
  fi
else
  if [ $HOSTNAME = $STANDBY_HOSTNAME ]; then
    echo "YES! VIP down & I'm STANDBY" && exit $OK
  fi
fi

echo "Oops! STANDBY has the VIP " && exit $CRITICAL
