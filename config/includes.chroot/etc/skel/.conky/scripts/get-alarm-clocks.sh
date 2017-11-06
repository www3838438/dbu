#!/bin/bash
#Get alarm-clock-applet running status
if pgrep alarm-clock >/dev/null
	then echo "X"
	exit 1
fi

##Get alarms
ALARMS=`gconftool-2 --all-dirs /apps/alarm-clock`

##Get alarms status
for i in $ALARMS
do
if [[ `gconftool-2 --get $i/active` = "true" && `gconftool-2 --get $i/type` = "clock" ]]
	then
	ALARMTIME=`gconftool-2 --get $i/time`
	TIMES="$TIMES $(date -u -d @${ALARMTIME} +"%H:%M")"
fi
done

echo $TIMES