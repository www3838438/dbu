## dbu - TODO


```

  ☐ [bug] doc: generate an index of package documentation pages, by category
  ☐ [bug] doc: generate documentation for disabled/*.chroot packages, add them to the index tagged `disabled`
  ☐ [bug] [firefox] add https://addons.mozilla.org/fr/firefox/addon/no-resource-uri-leak/
  ☐ [bug] [firefox] default ublock configuration
  ☐ [bug] [firefox] remove firefox default first run page (firefox accounts)
  ☐ [bug] [firefox] customize/reorganize UI elements (localstore.rdf)
  ☐ [enh] [security] [firefox] add mozilla-gnome-keyring addon
  ☐ [enh] setup assistant: select keyboard layout
  ☐ [enh] setup assistant: prevent from running in live mode?
  ☐ [enh] autostart: conky/clock
  ☐ [enh] show calendar when clicking on panel clock
  ☐ [enh] laptop-mode-tools vs. TLP ?
  ☐ [enh] [firefox] firefox default homepage/rss/bookmarks/bookmarklets/startpage; add btdigg, add archiveorg
  ☐ [doc] generate documentation from package lists
  ☐ [feature] BACKUPS! encrypted to ext drive (ask to format a backup drive, backup every 7 days, remind every 30 days: alarm clock, pidgin, ff bookmarks, ff passwords, transmission torrents, mail
  ☐ [bug] [unconfirmed] **screen locking:** configure light-locker from XFCE's power management settings. it locks too fast
  ☐ [bug] [l10n] re-add icedove-l10n-fr
  ☐ [debian] package unpackaged software for debian, see https://github.com/nodiscc/dbu-deb-packages
  ☐ [maint] remove gksu - gdebi still needs it - http://forums.debian.net/viewtopic.php?f=16&t=73497
  ☐ [enh] makefile: use shallow git clones (saves disk space, faster download)
  ☐ [enh] mousepad: add config (path?)
  ☐ [enh] onboard: add config (dconf)
  ☐ [enh] [live] add persistence http://live.debian.net/manual/stable/html/live-manual/customizing-run-time-behaviours#persistence
  ☐ [feature] Voice recognition/control/dictation
    https://en.wikipedia.org/wiki/Speech_recognition_in_Linux
    https://github.com/BmanDesignsCanada/LiSpeak/
    pocketsphinx!
  ☐ [enh] [libreoffice] Add LanguageTool Not packaged - https://github.com/languagetool-org/languagetool/issues/123 https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=403619
  ☐ [enh] [icedove] add default addons
  ☐ [enh] [security] Setup logcheck and logwatch - see srv01 - mail or notify weekly report
  ☐ [feature] alternative desktop environments: Split xfce components away from desktop-env.list.chroot. That way, just disabling xfce-destop.list.chroot and enabling openbox-desktop.list.chroot would switch the DE to Openbox. Another DE using docky or gnome3 is also possible.
  ☐ [feature] New Thunar UCA: Serve directory on local network Add a new context menu entry for directories: start web server in current directory (python -m SimpleHTTPServer ?)
  ☐ [feature] New Thunar UCA: edit text files as root
  ☐ [enh] [security] setup SELinux
  ☐ [enh] Better GRUB look and bootsplash: add pylmouth + debian-logo plymouth theme, add wallpaper in grub's dir, add `splash` to `\/etc\/default\/grub` options, and make sure `update-grub` runs during the build.
  ☐ some settings are hardcoded to french
      https://github.com/nodiscc/dbu/blob/master/config/includes.chroot/etc/locale.gen (generated locales)
      https://github.com/nodiscc/dbu/blob/master/config/includes.chroot/etc/skel/.config/Thunar/uca.xml (UCAs cannot be localized)
      https://github.com/nodiscc/dbu/blob/master/auto/config (default locale for live system)
      https://github.com/nodiscc/dbu/blob/master/config/includes.chroot/etc/icedove/pref/icedove.js (dictionary language)
      https://github.com/nodiscc/dbu/blob/master/config/includes.chroot/etc/default/keyboard (keyboard layout
      https://github.com/nodiscc/dbu/blob/master/config/archives/debian-jessie.list.binary (live system debian mirrors location)
      https://github.com/nodiscc/dbu/blob/master/config/includes.installer/preseed.cfg (installer debian mirrors location)




```
