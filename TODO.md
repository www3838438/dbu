## dbu - TODO


```

  ☐ [enh] Integrate more config panels to xfce4-settings-manager
        blueman
        software-properties-gtk
        nm-connection-editor
        pavucontrol
        seahorse
        services-admin
        shares-admin
        system-config-printer
        users-admin
        time-admin
     Creating a copy of the original .desktop in /usr/share/applications with the following categories added works: DesktopSettings;Settings;System;X-XFCE-HardwareSettings;X-XFCE-PersonalSettings;X-XFCE-SettingsDialog;X-XFCE-SystemSettings; but is overwritten on package upgrades. Find XFCE specific location for settings-manager wrapper .desktop files


  ☐ [enh] [easy] add mpv play/queue to thunar "send to" menu
  ☐ [bug] [doc] generate documentation for disabled/*.chroot packages, add them to the index tagged `disabled`
  ☐ [bug] [firefox] default ublock configuration -> on first run, propose running `firefox chrome://ublock0/content/dashboard.html#3p-filters.html`
  ☐ [bug] [firefox] customize/reorganize UI elements (localstore.rdf)
  ☐ [bug] [firefox] add more search engines
  ☐ [bug] autorun pk-update-icon
  ☐ [bug] "open containing folder" in gnome-search-tool does not work (attemps to open selected file)
  ☐ [enh] [doc] add package versions to generated md documentation
  ☐ [enh] [packages] 2 separate package lists for audacious/quodlibet
  ☐ [enh] disable non-free repositories, fetch firmware with wget/makefile target before build (branch no-nonfree)
  ☐ [enh] add travis config for tests/automated builds
  ☐ [enh] setup assistant: select keyboard layout
  ☐ [enh] keyboard-configuration interrupts unattended chroot build
  ☐ [bug] autostart: conky/clock
  ☐ [enh] show calendar when clicking on panel clock
  ☐ [enh] [firefox] firefox default homepage/rss/bookmarks/bookmarklets/startpage
  ☐ [doc] generate documentation from package lists
  ☐ [feature] BACKUPS! encrypted to ext drive (ask to format a backup drive, backup every 7 days, remind every 30 days: alarm clock, pidgin, ff bookmarks, ff passwords, transmission torrents, mail
  ☐ [bug] [unconfirmed] **screen locking:** configure light-locker from XFCE's power management settings. it locks too fast
  ☐ [bug] [l10n] re-add icedove-l10n-fr
  ☐ [debian] package unpackaged software for debian, see https://github.com/nodiscc/dbu-deb-packages
  ☐ [maint] remove gksu - gdebi still needs it - http://forums.debian.net/viewtopic.php?f=16&t=73497
  ☐ [enh] [wait] transition to stretch when it becomes stable: enable stretch-only packages in package lists; switch icedove->thunderbird+lightning
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
  ☐ [l10n] some settings are hardcoded to french
           https://github.com/nodiscc/dbu/blob/master/config/includes.chroot/etc/locale.gen (generated locales)
           https://github.com/nodiscc/dbu/blob/master/config/includes.chroot/etc/skel/.config/Thunar/uca.xml (UCAs cannot be localized)
           https://github.com/nodiscc/dbu/blob/master/auto/config (default locale for live system)
           https://github.com/nodiscc/dbu/blob/master/config/includes.chroot/etc/icedove/pref/icedove.js (dictionary language)
           https://github.com/nodiscc/dbu/blob/master/config/includes.chroot/etc/default/keyboard (keyboard layout
           https://github.com/nodiscc/dbu/blob/master/config/archives/debian-jessie.list.binary (live system debian mirrors location)
           https://github.com/nodiscc/dbu/blob/master/config/includes.installer/preseed.cfg (installer debian mirrors location)
  ☐ [l10n] provide a way to select language/locale at boot time
  ☐ [enh] Some Firefox addons are not e10s compatible. When Firefox 57 is out (nov. 14 2017), they will stop working. Add e10s support or find equivalent compatible addons:
           Add to Search Bar Not compatible with multiprocess.
           Clean Links Not compatible with multiprocess.
           RSS Icon in url bar Not compatible with multiprocess.
           Self-Destructing Cookies Not compatible with multiprocess. 
           Yet Another Context Search Not compatible with multiprocess.


```
