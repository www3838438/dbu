w## dbu - TODO


```

  ☐ [bug] [TEST] [doc] add packages.chroot/* and software downloaded through makefile to packages/installed software documentation
  ☐ [bug] some firefox addons are not installed: no resource uri leak, cookie autodelete, dark mode, ...
  ☐ [bug] GRUB > Advanced > Live (@FLAVOUR@ failsafe)
  ☐ [enh] preseed "domain name" installer question to None, preseed "full user name" question to match the unix username
  ☐ [bug] package all unpackaged software (includes.chroot/usr...), or send patches upstream when possible
  ☐ [bug] doc: link generation for screenshots and some hompage links is broekn, packages.md category/list generation is broken
  ☐ [bug] package 3rd party .debs for inclusion in Debian archives (or setup a temporary APT repo for the build, but disable it in the chroot)
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
  ☐ [enh] [packages] split devel-tools-base/devel-tools-advanced package lists, disable advanced list for chroot, enable it for binary, create a metapackage for advanced dev tools
  ☐ [enh] [packages] remove gksu - gdebi still needs it - http://forums.debian.net/viewtopic.php?f=16&t=73497
  ☐ [enh] [live] add persistence http://live.debian.net/manual/stable/html/live-manual/customizing-run-time-behaviours#persistence
  ☐ [enh] Voice recognition/control/dictation (pocketsphinx?)
  ☐ [enh] OCR/document management solution - https://github.com/openpaperwork/paperwork/issues/466 https://bugs.debian.org/721287
  ☐ [enh] Add Grammalecte French grammar checker for Firefox/Libreoffice https://www.dicollecte.org/grammalecte/telecharger.php
  ☐ [enh] thunderbird: add default addons
  ☐ [enh] add a package list for audio workstations (see disabled/desktop-audio-workstation.list.chroot, https://github.com/nodiscc/awesome-linuxaudio)
  ☐ [enh] firefox: setup default UI config/disposition `user_pref("browser.uiCustomization.state", "{\"placements\":{\"PanelUI-contents\":[\"zoom-controls\",\"new-window-button\",\"privatebrowsing-button\",\"save-page-button\",\"print-button\",\"history-panelmenu\",\"fullscreen-button\",\"find-button\",\"home-button\",\"preferences-button\",\"add-ons-button\",\"social-share-button\",\"email-link-button\",\"sidebar-button\",\"https-everywhere-button\",\"action-button--jid0-9xfbwuwnvpx4wwsfbwmcm4jj69ejetpack-self-destructing-cookies\"],\"addon-bar\":[\"addonbar-closebutton\",\"status-bar\"],\"PersonalToolbar\":[\"personal-bookmarks\"],\"nav-bar\":[\"urlbar-container\",\"bookmarks-menu-button\",\"search-container\",\"downloads-button\",\"loop-button\",\"ublock0-button\",\"feed-button\"],\"TabsToolbar\":[\"tabbrowser-tabs\",\"new-tab-button\",\"alltabs-button\"],\"toolbar-menubar\":[\"menubar-items\"]},\"seen\":[\"ublock0-button\",\"action-button--jid0-9xfbwuwnvpx4wwsfbwmcm4jj69ejetpack-self-destructing-cookies\"],\"dirtyAreaCache\":[\"PersonalToolbar\",\"nav-bar\",\"TabsToolbar\",\"toolbar-menubar\",\"PanelUI-contents\",\"addon-bar\"],\"currentVersion\":5,\"newElementCount\":0}");`
  ☐ [enh] pidgin: add https://github.com/gkdr/lurch plugin - OMEMO encryption support
  ☐ [enh] security: Setup logcheck and logwatch - see srv01 - mail or notify weekly report
  ☐ [enh] setup sandboxing/RBAC (SELinux/Apparmor?)
  ☐ [enh] Find e10s and/or Webextensions compatible addons for Firefox (https://addons.mozilla.org/en-US/firefox/search/?tag=firefox57)
  ☐ [enh] Display more items in xfce4-settings-manager: `blueman-manager.desktop dbu-software-properties-gtk.desktop exo-preferred-applications.desktop gparted.desktop light-locker-settings.desktop menulibre.desktop network.desktop nm-connection-editor.desktop org.gnome.DiskUtility.desktop org.gnome.Packages.desktop org.gnome.FontManager.desktop org.gnome.PackageUpdater.desktop org.gnome.Software.desktop panel-preferences.desktop paprefs.desktop qtconfig-qt4.desktop seahorse.desktop services.desktop shares.desktop software-properties-drivers.desktop software-properties-gnome.desktop software-properties-gtk.desktop steam.desktop backintime-qt4.desktop backintime-qt4-root.desktop synaptic.desktop system-config-printer.desktop time.desktop users.desktop pavucontrol.desktop`
  ☐ [enh] Makefile: automate torrent creation: transmission-create dbu-0.9n-debian-stretch-amd64.hybrid.iso -o dbu-0.9n-debian-stretch-amd64.hybrid.iso.torrent -t  udp://tracker.opentrackr.org:1337 -t  udp://tracker.coppersurfer.tk:6969   -t udp://tracker.leechers-paradise.org:6969 -t  udp://zer0day.ch:1337 -t  udp://explodie.org:6969

```
