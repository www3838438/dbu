## dbu - TODO


```

  ☐ [bug] [TEST] [doc] add packages.chroot/* and software downloaded through makefile to packages/installed software documentation
  ☐ [bug] move gpwgen to 3rd party repo/deb, or find another graphical password generator in repos
  ☐ [bug] upstream launchers in /usr/share/applications/, or package in 3rd party repos/debs
  ☐ [bug] move gtksourceview to 3rd party deb
  ☐ [bug] move plymouth/debian-logo to 3rd party deb
  ☐ [bug] package wallpapers in 3rd party repo/deb, xfce4 color schemes, 
  ☐ [bug] upstream/package Thunar sendto wrappers
  ☐ [bug] remove custom directories: /usr/local/, fonts! (used by conky, rewrite, simplify), synapse config in /usr/, ffmpegthumbnailer, 
  ☐ [bug] package all unpackaged dependencies (Makefile and scripts in /usr/local/bin/) for Debian
  ☐ [bug] package all unpackaged dependencies (Makefile and scripts in /usr/local/bin/) for Debian
  ☐ [bug] test whether multiarch is really supported/working.
  ☐ [bug] [security] checksum iso images, sign checksum files with GPG, provide verification instructions in install.md
  ☐ [bug] add master switch in makefile to build without non-debian program dependencies
  ☐ [enh] [doc] add package versions to generated md documentation
  ☐ [enh] [doc] generate documentation for disabled/*.chroot packages?, add them to the index tagged `disabled`
  ☐ [bug] improve bluetooth power saving: powertop still shows 100% power usage on bluetooth card even with rfkill block. Settings in /etc/laptop-mode-tools/bluetooth.conf
  ☐ [enh] [doc] update README/releases screenshot
  ☐ [enh] disable redshift autostart (throws an error message in VMs since it can not adjust gamma)
  ☐ [bug] "open containing folder" in gnome-search-tool does not work (attempts to open selected file)
  ☐ [enh] [packages] 2 separate package lists for audacious/quodlibet
  ☐ [enh] disable non-free repositories, fetch firmware with wget/makefile target before build (branch no-nonfree)
  ☐ [enh] add travis config for tests/automated builds, add KVM/QEMU settings to run resulting ISO in KVM/QEMU
  ☐ [enh] keyboard-configuration interrupts unattended build
  ☐ [enh] split devel-tools-base/devel-tools-advanced package lists, disable advanced list for chroot, enable it for binary, create a metapackage for advanced dev tools
  ☐ [feature] BACKUPS! encrypted to external drive (ask to format a backup drive, backup every 7 days, remind every 30 days: alarm clock, pidgin, ff bookmarks, ff passwords, transmission torrents, mail
  ☐ [bug] [unconfirmed] **screen locking:** configure light-locker from XFCE's power management settings. it locks too fast
  ☐ [maint] remove gksu - gdebi still needs it - http://forums.debian.net/viewtopic.php?f=16&t=73497
  ☐ [enh] [live] add persistence http://live.debian.net/manual/stable/html/live-manual/customizing-run-time-behaviours#persistence
  ☐ [feature] Voice recognition/control/dictation (pocketsphinx?)
  ☐ [enh] Add Grammalecte French grammar checker for Firefox/Libreoffice https://www.dicollecte.org/grammalecte/telecharger.php
  ☐ [enh] thunderbird: add default addons
  ☐ [enh] pidgin: add https://github.com/gkdr/lurch plugin - OMEMO encryption support
  ☐ [enh] security: Setup logcheck and logwatch - see srv01 - mail or notify weekly report
  ☐ [enh] alternative desktop environments: Split xfce components away from desktop-env.list.chroot. That way, just disabling xfce-destop.list.chroot and enabling openbox-desktop.list.chroot would switch the DE to Openbox. Another DE using docky or gnome3 is also possible.
  ☐ [feature] New Thunar UCA: Serve directory on local network Add a new context menu entry for directories: start web server in current directory (python -m SimpleHTTPServer ?)
  ☐ [feature] New Thunar UCA: edit text files as root
  ☐ [enh] [security] setup SELinux
  ☐ [enh] Better GRUB look and bootsplash: add pylmouth + debian-logo plymouth theme, add wallpaper in grub's dir, add `splash` to `\/etc\/default\/grub` options, and make sure `update-grub` runs during the build.
  ☐ [enh] [l10n] provide more language/locale choices at boot time (which languages?)
  ☐ [enh] Find e10s and/or Webextensions compatible addons for Firefox (https://addons.mozilla.org/en-US/firefox/search/?tag=firefox57)
           Add to Search Bar Not compatible with multiprocess.
           Clean Links Not compatible with multiprocess.
           RSS Icon in url bar Not compatible with multiprocess.
           Self-Destructing Cookies Not compatible with multiprocess. 
           Yet Another Context Search Not compatible with multiprocess.
  ☐ [enh] Display more items in xfce4-settings-manager: `blueman-manager.desktop dbu-software-properties-gtk.desktop exo-preferred-applications.desktop gparted.desktop light-locker-settings.desktop menulibre.desktop network.desktop nm-connection-editor.desktop org.gnome.DiskUtility.desktop org.gnome.Packages.desktop org.gnome.FontManager.desktop org.gnome.PackageUpdater.desktop org.gnome.Software.desktop panel-preferences.desktop paprefs.desktop qtconfig-qt4.desktop seahorse.desktop services.desktop shares.desktop software-properties-drivers.desktop software-properties-gnome.desktop software-properties-gtk.desktop steam.desktop backintime-qt4.desktop backintime-qt4-root.desktop synaptic.desktop system-config-printer.desktop time.desktop users.desktop pavucontrol.desktop`


```
