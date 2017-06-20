## dbu - TODO


```

  ☐ [bug] [TEST] [doc] add packages.chroot/* and software downloaded through makefile to packages/installed software documentation
  ☐ [bug] package all unpackaged software (includes.chroot/usr...), or send patches upstream when possible
  ☐ [bug] package 3rd party .debs for inclusion in Debian archives (or setup a temporary APT repo for the build, but disable it in the chroot)
  ☐ [bug] test whether multiarch is really supported/working (steam)
  ☐ [bug] add master switch in makefile to build without non-debian program dependencies
  ☐ [bug] [security] verify integrity and GPG signatures for packages.chroot/*.deb: https://askubuntu.com/questions/253728/how-to-safely-download-and-gpg-verify-a-debian-source-package
  ☐ [enh] [doc] add package versions to generated md documentation
  ☐ [enh] [doc] generate documentation for disabled/*.chroot packages?, add them to the index tagged `disabled`
  ☐ [bug] improve bluetooth power saving: powertop still shows 100% power usage on bluetooth card even with rfkill block. Settings in /etc/laptop-mode-tools/bluetooth.conf
  ☐ [enh] [doc] update screenshot
  ☐ [bug] "open containing folder" in gnome-search-tool does not work (attempts to open selected file)
  ☐ [enh] [packages] 2 separate package lists for audacious/quodlibet
  ☐ [enh] disable non-free repositories, fetch firmware with wget/makefile target before build (branch no-nonfree)
  ☐ [enh] add travis config for tests/automated builds, add KVM/QEMU settings to run resulting ISO in KVM/QEMU
  ☐ [enh] keyboard-configuration interrupts unattended build
  ☐ [enh] split devel-tools-base/devel-tools-advanced package lists, disable advanced list for chroot, enable it for binary, create a metapackage for advanced dev tools
  ☐ [bug] [unconfirmed] **screen locking:** configure light-locker from XFCE's power management settings. it locks too fast
  ☐ [maint] remove gksu - gdebi still needs it - http://forums.debian.net/viewtopic.php?f=16&t=73497
  ☐ [enh] [live] add persistence http://live.debian.net/manual/stable/html/live-manual/customizing-run-time-behaviours#persistence
  ☐ [feature] Voice recognition/control/dictation (pocketsphinx?)
  ☐ [enh] Add Grammalecte French grammar checker for Firefox/Libreoffice https://www.dicollecte.org/grammalecte/telecharger.php
  ☐ [enh] thunderbird: add default addons
  ☐ [enh] pidgin: add https://github.com/gkdr/lurch plugin - OMEMO encryption support
  ☐ [enh] security: Setup logcheck and logwatch - see srv01 - mail or notify weekly report
  ☐ [enh] [security] setup SELinux
  ☐ [enh] Find e10s and/or Webextensions compatible addons for Firefox (https://addons.mozilla.org/en-US/firefox/search/?tag=firefox57)
  ☐ [enh] Display more items in xfce4-settings-manager: `blueman-manager.desktop dbu-software-properties-gtk.desktop exo-preferred-applications.desktop gparted.desktop light-locker-settings.desktop menulibre.desktop network.desktop nm-connection-editor.desktop org.gnome.DiskUtility.desktop org.gnome.Packages.desktop org.gnome.FontManager.desktop org.gnome.PackageUpdater.desktop org.gnome.Software.desktop panel-preferences.desktop paprefs.desktop qtconfig-qt4.desktop seahorse.desktop services.desktop shares.desktop software-properties-drivers.desktop software-properties-gnome.desktop software-properties-gtk.desktop steam.desktop backintime-qt4.desktop backintime-qt4-root.desktop synaptic.desktop system-config-printer.desktop time.desktop users.desktop pavucontrol.desktop`

```
