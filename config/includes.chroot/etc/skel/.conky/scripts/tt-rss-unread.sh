#!/bin/bash
# Description: display number of unread items in your tt-rss instance
# Thanks to https://gist.github.com/anonymous/4699745

if [ -f ~/.conky/scripts.conf ]
	then source ~/.conky/scripts.conf
	else echo -e "TTRSS_USER=\"\"\nTTRSS_PASS=\"\"" >> ~/.conky/scripts.conf
fi

if [ "$TTRSS_USER" = "" ]
	then echo "????"
else
API_URL="$TTRSS_URL/api/"

api_req() {
    if [[ -n "$HTTP_BASIC_AUTH" ]]; then
        answer=`curl --insecure -s "$API_URL" -X POST -u "$HTTP_BASIC_AUTH" -d "$1"`
    else
        answer=`curl --insecure -s "$API_URL" -X POST -d "$1"`
    fi

    echo $answer
}

get_value() {
    echo $1 | grep -Po '(?<="'"$2"'":").*?(?=")'
}

data='{"op": "login", "user": "'"$TTRSS_USER"'", "password": "'"$TTRSS_PASS"'"}'
login_answer=`api_req "$data"`
sid=`get_value "$login_answer" "session_id"`

data='{"sid": "'$sid'", "op": "getUnread"}'
unread_answer=`api_req "$data"`
count=`get_value "$unread_answer" "unread"`

echo $count

fi