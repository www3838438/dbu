#!/bin/bash
# Description: displays the current balance of a bank account using boobank
# Boobank must be configured beforehand

if [ -f ~/.conky/scripts.conf ]
	then source ~/.conky/scripts.conf
	else echo -e "BANK=\"\"" >> ~/.conky/scripts.conf
fi


if [ "$BANK" = "" ]
	then echo "????"
	else boobank -b $BANK list | grep "Total" | awk -F " " '{print $2}'
fi