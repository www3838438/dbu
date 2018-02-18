// This is the Debian specific preferences file for Mozilla Thunderbird
// You can make any change in here, it is the purpose of this file.
// You can, with this file and all files present in the directory
//
//      /etc/thunderbird/pref directory
//
// override any preference that is present in the directory
//
//      /usr/lib/thunderbird/defaults/pref
//
// While your changes will be kept on upgrade if you modify files in
// /etc/thunderbird/pref, please note that they won't be kept if you
// do them in /usr/lib/thunderbird/defaults/pref.

pref("extensions.update.enabled", true);

// Use LANG environment variable to choose locale
pref("intl.locale.matchOS", true);

// Disable default mail checking (gnome).
pref("mail.shell.checkDefaultMail", false);

// Disable default mail client check
pref("mail.shell.checkDefaultClient", false);

// if you are not using gnome
pref("network.protocol-handler.app.http", "x-www-browser");
pref("network.protocol-handler.app.https", "x-www-browser");

// This setting is a workaround for some crashes inside the JS engine.
// By this Icedove will use more memory and acting slower as the sharing
// memory between interacting JS files is disabled.
pref ("javascript.options.baselinejit", false);
//Calendar week starts on monday
pref("calendar.week.start", 1);

// Uncomment the follwing setting if you want to have a extra mail header field
// for X-Debbugs-Cc, only needed in case you have to work with the Debian
// Bug Tracking System more deeply
//pref("mail.compose.other.header", "X-Debbugs-Cc");

//Do not hide saturday/sunday from calendar view
pref("d6saturdaysoff", false);
pref("d0sundaysoff", false);

//24 hours visible in calendar view
pref("calendar.view.visiblehours", 24);

//Day start/end times
pref("calendar.view.daystarthour", 6);
pref("calendar.view.dayendhour", 24);

//Always download attachments to local computer
pref("mail.imap.mime_parts_on_demand", false);

//Spell checker language
pref("spellchecker.dictionary", "fr");

//Disable Thunderbird chat/instant messaging
pref("mail.chat.enabled", false);

//Default mail sort order
//https://developer.mozilla.org/en-US/docs/Mozilla/Tech/XPCOM/Reference/nsMsgViewSortType
//https://developer.mozilla.org/en-US/docs/Mozilla/Tech/XPCOM/Reference/nsMsgViewSortOrder
//Sort dy descending date
pref("mailnews.default_sort_type", 18);
pref("mailnews.default_sort_order", 2);

//Check all folders for new messages
pref("mail.server.default.check_all_folders_for_new", true);
