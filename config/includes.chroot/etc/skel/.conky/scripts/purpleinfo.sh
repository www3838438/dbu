#!/bin/bash
#Description: Script to get and display data from pidgin (info on online contacts, etc..)
#Source: https://github.com/nodiscc/rxtx-conkyrcs
#License: MIT (http://opensource.org/licenses/MIT)

if ! pgrep pidgin >/dev/null
	then
	echo "X"; exit 1
fi

### GET VARIABLES ###
ActiveAccounts=$(/usr/bin/purple-send PurpleAccountsGetAllActive | grep int32 | awk -F" " '{print $2}')

AllContacts=$(
for Account in $ActiveAccounts; do
	/usr/bin/purple-send PurpleFindBuddies "int32:$Account" "string:" | grep int32 | awk -F" " '{print $2}'
done
)

OnlineContacts=$(
for Contact in $AllContacts; do
	echo "$Contact `/usr/bin/purple-send PurpleBuddyIsOnline "int32:$Contact" | grep "int32 1"`" | grep "int32 1" | awk -F " " '{print $1}'
done
)

OnlineContactsNum=$(
	echo "$OnlineContacts" | wc -l
)


### FUNCTIONS ###
OnlineContactsNum() { #print number of online contacts
echo "$OnlineContactsNum"
} 

### MAIN LOOP ###
$1

