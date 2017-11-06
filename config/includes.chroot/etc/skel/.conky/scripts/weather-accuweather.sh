#!/bin/sh
#AccuWeather (r) RSS weather tool for conky
#
#USAGE: weather.sh <locationcode>
#
#(c) Michael Seiler 2007

METRIC=1 #Should be 0 or 1; 0 for F, 1 for C

if [ -f ~/.conky/scripts.conf ]
    then source ~/.conky/scripts.conf
    else echo -e "WEATHER_LOCATION=\"\"" >> ~/.conky/scripts.conf
fi

if [ -z $WEATHER_LOCATION ]; then
    echo
    echo "USAGE: weather.sh <locationcode>"
    echo
    exit 0;
fi

curl -s http://rss.accuweather.com/rss/liveweather_rss.asp\?metric\=${METRIC}\&locCode\=$WEATHER_LOCATION | perl -ne 'if (/Currently/) {chomp;/\<title\>Currently: (.*)?\<\/title\>/; print "$1"; }'
