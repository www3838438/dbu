## dbu - TODO


```

  ☐ [bug] package all unpackaged dependencies (Makefile and scripts in /usr/local/bin/) for Debian
  ☐ [bug] test whether multiarch is really supported/working.
  ☐ [bug] [security] checksum iso images, sign checksum files with GPG, provide verification instructions in install.md
  ☐ [bug] [doc] add packages.chroot/* and software downloaded through makefile to packages/installed software documentation
  ☐ [enh] [doc] add package versions to generated md documentation
  ☐ [enh] [doc] generate documentation for disabled/*.chroot packages?, add them to the index tagged `disabled`
  ☐ [bug] [firefox] ublock configuration -> on first run, propose running `firefox chrome://ublock0/content/dashboard.html#3p-filters.html`
  ☐ [bug] [firefox] HTTPS Everywhere SSL observatory popup is not really disabled
  ☐ [enh] [firefox] customize/reorganize UI elements (localstore.rdf)
  ☐ [enh] [firefox] make ohmpage the "new tab" page
  ☐ [bug] autorun pk-update-icon
  ☐ [bug] improve bluetooth power saving: powertop still shows 100% power usage on bluetooth card even with rfkill block. Settings in /etc/laptop-mode-tools/bluetooth.conf
  ☐ [enh] [doc] update screenshot
  ☐ [enh] disable redshift autostart (throws an error message in VMs since it can not adjust gamma)
  ☐ [bug] "open containing folder" in gnome-search-tool does not work (attempts to open selected file)
  ☐ [enh] [packages] 2 separate package lists for audacious/quodlibet
  ☐ [enh] disable non-free repositories, fetch firmware with wget/makefile target before build (branch no-nonfree)
  ☐ [enh] add travis config for tests/automated builds, add KVM/QEMU settings to run resulting ISO in KVM/QEMU
  ☐ [enh] dbu-setup-assistant: do not show in live mode ?
  ☐ [enh] keyboard-configuration interrupts unattended build
  ☐ [enh] show calendar when clicking on panel clock
  ☐ [enh] [firefox] firefox default bookmarks/bookmarklets
  ☐ [feature] BACKUPS! encrypted to external drive (ask to format a backup drive, backup every 7 days, remind every 30 days: alarm clock, pidgin, ff bookmarks, ff passwords, transmission torrents, mail
  ☐ [bug] [unconfirmed] **screen locking:** configure light-locker from XFCE's power management settings. it locks too fast
  ☐ [maint] remove gksu - gdebi still needs it - http://forums.debian.net/viewtopic.php?f=16&t=73497
  ☐ [enh] [wait] transition to stretch when it becomes stable: enable stretch-only packages in package lists; switch icedove->thunderbird+lightning
  ☐ [enh] mousepad: add config (path?)
  ☐ [bug] [l10n] do not hardcode geospecific debian mirror, use http://deb.debian.org/
  ☐ [enh] onboard: add config (dconf)
  ☐ [enh] [live] add persistence http://live.debian.net/manual/stable/html/live-manual/customizing-run-time-behaviours#persistence
  ☐ [feature] Voice recognition/control/dictation (pocketsphinx?)
  ☐ [enh] Add Grammalecte French grammar checker for Firefox/Libreoffice https://www.dicollecte.org/grammalecte/telecharger.php
  ☐ [enh] [icedove] add default addons
  [enh] [pidgin] add https://github.com/gkdr/lurch plugin - OMEMO encryption support
  ☐ [enh] [security] Setup logcheck and logwatch - see srv01 - mail or notify weekly report
  ☐ [enh] alternative desktop environments: Split xfce components away from desktop-env.list.chroot. That way, just disabling xfce-destop.list.chroot and enabling openbox-desktop.list.chroot would switch the DE to Openbox. Another DE using docky or gnome3 is also possible.
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
  ☐ [enh] [l10n] provide more language/locale choices at boot time (which languages?)
  ☐ [enh] Some Firefox addons are not e10s compatible. When Firefox 57 is out (nov. 14 2017), they will stop working. Add e10s support or find equivalent compatible addons:
           Add to Search Bar Not compatible with multiprocess.
           Clean Links Not compatible with multiprocess.
           RSS Icon in url bar Not compatible with multiprocess.
           Self-Destructing Cookies Not compatible with multiprocess. 
           Yet Another Context Search Not compatible with multiprocess.
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
        menulibre
     Creating a copy of the original .desktop in /usr/share/applications with the following categories added works: DesktopSettings;Settings;System;X-XFCE-HardwareSettings;X-XFCE-PersonalSettings;X-XFCE-SettingsDialog;X-XFCE-SystemSettings; but is overwritten on package upgrades. Find XFCE specific location for settings-manager wrapper .desktop files

```
