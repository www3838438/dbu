#!/bin/bash
if [ -f ~/.conky/scripts.conf ]
	then source ~/.conky/scripts.conf
	else echo -e "TODOTXT_LOCATION=\"\"" >> ~/.conky/scripts.conf
fi

if [ "$TODOTXT_LOCATION" = "" ]
	then echo "????"
else
	egrep "[a-z,A-Z]" $TODOTXT_LOCATION |wc -l
fi