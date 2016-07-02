## dbu - TODO

  ☐ [bug] greasemonkey scripts not detected!
  ☐ [enh] preseed keyboard configuration
  ☐ [bug] include mousepad config (path?)
  ☐ [maybe] switch build system?  https://lists.debian.org/debian-live/2015/11/msg00128.html
  ☐ offline installer, live image
  ☐ documentation system (readthedocs?)
  ☐ [enh] firefox default homepage/rss/bookmarks/bookmarklets/startpage; add btdigg, add archiveorg
  ☐ [feature] BACKUPS! encrypted to ext drive (ask to format a backup drive, backup every 7 days, remind every 30 days: alarm clock, pidgin, ff bookmarks, ff passwords, transmission torrents, mail
  ☐ [enh] setup assistant - propose to set noatime/nodiratime for ext3/4 partitions, disable/enable services
  ☐ [maint] remove gksu - gdebi still needs it - http://forums.debian.net/viewtopic.php?f=16&t=73497
  ☐ [iceweasel] default ublock configuration
  ☐ [onboard] add dconf settings
  ☐ [enh] [sec] mozilla-gnome-keyring
  ☐ [live] add persistence http://live.debian.net/manual/stable/html/live-manual/customizing-run-time-behaviours#persistence
  ☐ [feature] Voice recognition/control/dictation
    https://en.wikipedia.org/wiki/Speech_recognition_in_Linux
    https://github.com/BmanDesignsCanada/LiSpeak/
    pocketsphinx!
  ☐ [libreoffice] Add LanguageTool Not packaged - https://github.com/languagetool-org/languagetool/issues/123 https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=403619
  ☐ [icedove] default addons
 ☐ [debian] package unpackaged software for debian, see https://github.com/nodiscc/dbu-deb-packages
  ☐ [security] Setup logcheck and logwatch - see srv01 - mail or notify weekly report
  ☐ [feature] alternative desktop environments: Split xfce components away from desktop-env.list.chroot. That way, just disabling xfce-destop.list.chroot and enabling openbox-desktop.list.chroot would switch the DE to Openbox. Another DE using docky or gnome3 is also possible.
  ☐ [feature] New Thunar UCA: Serve directory on local network Add a new context menu entry for directories: start web server in current directory (python -m SimpleHTTPServer ?)
  ☐ [feature] New Thunar UCA: edit text files as root
  ☐ [bug] **screen locking:** configure light-locker from XFCE's power management settings. it locks too fast
  ☐ [maint] **notifications**: Replace unmaintained udev-notify with volnoti: https://github.com/davidbrazdil/volnoti
  ☐ [L10N] re-add icedove-li10n-fr
  ☐ [bug] update xfce4-pane
  ☐ [enh] theme numix + numix circle
  ☐ [enh] copy firefox search engines to synapse
  ☐ [enh] [sec] setup SELinux
  ☐ [enh] [desktop] xcalib "invert screen colors" script is incompatible with redshift (colors reset)
  ☐ [maybe] build with debian-cd
  ☐ [maybe] Better GRUB look and bootsplash: add pylmouth + debian-logo plymouth theme, add wallpaper in grub's dir, add `splash` to `\/etc\/default\/grub` options, and make sure `update-grub` runs during the build.


WONTFIX ☐ ~~display a count of remotely exploitable, high severity bugs in a notification popup. Create a graphical (zenity?) wrapper for debsecan and add it to the system menu and xfce4-settings-manager numvulns=$(debsecan | grep -i high | grep -i remote |sort | cut -f 1 -d " " | wc -l | sort -u)~~ replaced with logcheck solution