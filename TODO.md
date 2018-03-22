## dbu - TODO


```
  ☐ [bug] check that apparmor is enabled
  ☐ [bug] "open containing folder" in gnome-search-tool does not work (attempts to open selected file)
  ☐ [enh] installer: preseed "domain name" installer question to None, preseed "full user name" question to match the unix username
  ☐ [enh] improve bluetooth power saving: powertop still shows 100% power usage on bluetooth card even with rfkill block. Settings in /etc/laptop-mode-tools/bluetooth.conf
  ☐ [enh] Host ISO on http://iso.linuxquestions.org/? Find a seedbox
  ☐ [enh] [doc] list installed/recommended firefox addons (parse makefile) on firefox package page
  ☐ [enh] [doc] add icons to main package list/sublists (parse .list; find #Icon: field, or use first package name , copy/embed /usr/share/icons/$theme/$size/apps/$icon.png)
  ☐ [enh] Enable IPv6 support (sysctl, firewall, apt config...)
  ☐ [enh] [tools] add master switch in makefile to build without non-debian program dependencies
  ☐ [enh] [tools] better caching for makefile dependencies
  ☐ [enh] [tools] add travis config for tests/automated builds, add KVM/QEMU settings to run resulting ISO in KVM/QEMU
  ☐ [enh] [tools] keyboard-configuration interrupts unattended build, preseed it in config/preseed/*.chroot.cfg
  ☐ [enh] [tools] Update Firefox channel to latest/release, bump addons tagged [FF52ESR] to their latest versions
  ☐ [enh] [tools] Makefile: automate torrent creation: transmission-create dbu-0.9n-debian-stretch-amd64.hybrid.iso -o dbu-0.9n-debian-stretch-amd64.hybrid.iso.torrent -t  udp://tracker.opentrackr.org:1337 -t  udp://tracker.coppersurfer.tk:6969   -t udp://tracker.leechers-paradise.org:6969 -t  udp://zer0day.ch:1337 -t  udp://explodie.org:6969
  ☐ [enh] [cleanup] split devel-tools-base/devel-tools-advanced package lists, disable advanced list for chroot, enable it for binary, create a metapackage for advanced dev tools
  ☐ [enh] [cleanup] remove gksu - gdebi still needs it - http://forums.debian.net/viewtopic.php?f=16&t=73497
  ☐ [enh] [cleanup] 2 separate package lists for audacious/quodlibet
  ☐ [enh] [cleanup] disable non-free repositories, fetch firmware with wget/makefile target before build (branch no-nonfree)
  ☐ [enh] Display more items in xfce4-settings-manager: `blueman-manager.desktop dbu-software-properties-gtk.desktop exo-preferred-applications.desktop gparted.desktop light-locker-settings.desktop menulibre.desktop network.desktop nm-connection-editor.desktop org.gnome.DiskUtility.desktop org.gnome.Packages.desktop org.gnome.FontManager.desktop org.gnome.PackageUpdater.desktop org.gnome.Software.desktop panel-preferences.desktop paprefs.desktop qtconfig-qt4.desktop seahorse.desktop services.desktop shares.desktop software-properties-drivers.desktop software-properties-gnome.desktop software-properties-gtk.desktop steam.desktop backintime-qt4.desktop backintime-qt4-root.desktop synaptic.desktop system-config-printer.desktop time.desktop users.desktop pavucontrol.desktop`
  ☐ [enh] [feature] add persistence http://live.debian.net/manual/stable/html/live-manual/customizing-run-time-behaviours#persistence
  ☐ [enh] [feature] Voice recognition/control/dictation (pocketsphinx?)
  ☐ [enh] [feature] OCR/document management solution - https://github.com/openpaperwork/paperwork/issues/466 https://bugs.debian.org/721287
  ☐ [enh] [feature] thunderbird: add default addons
  ☐ [enh] [feature] add a package list for audio workstations (see `desktop-audio-editor-audacity.list.chroot`, https://github.com/nodiscc/awesome-linuxaudio)
  ☐ [enh] firefox: setup default UI config/disposition `user_pref("browser.uiCustomization.state", "{\"placements\":{\"PanelUI-contents\":[\"zoom-controls\",\"new-window-button\",\"privatebrowsing-button\",\"save-page-button\",\"print-button\",\"history-panelmenu\",\"fullscreen-button\",\"find-button\",\"home-button\",\"preferences-button\",\"add-ons-button\",\"social-share-button\",\"email-link-button\",\"sidebar-button\",\"https-everywhere-button\",\"action-button--jid0-9xfbwuwnvpx4wwsfbwmcm4jj69ejetpack-self-destructing-cookies\"],\"addon-bar\":[\"addonbar-closebutton\",\"status-bar\"],\"PersonalToolbar\":[\"personal-bookmarks\"],\"nav-bar\":[\"urlbar-container\",\"bookmarks-menu-button\",\"search-container\",\"downloads-button\",\"loop-button\",\"ublock0-button\",\"feed-button\"],\"TabsToolbar\":[\"tabbrowser-tabs\",\"new-tab-button\",\"alltabs-button\"],\"toolbar-menubar\":[\"menubar-items\"]},\"seen\":[\"ublock0-button\",\"action-button--jid0-9xfbwuwnvpx4wwsfbwmcm4jj69ejetpack-self-destructing-cookies\"],\"dirtyAreaCache\":[\"PersonalToolbar\",\"nav-bar\",\"TabsToolbar\",\"toolbar-menubar\",\"PanelUI-contents\",\"addon-bar\"],\"currentVersion\":5,\"newElementCount\":0}");`
  ☐ [enh] [feature] pidgin: add https://github.com/gkdr/lurch plugin - OMEMO encryption support
  ☐ [enh] [feature] [security] Setup logcheck and logwatch - see srv01 - mail or notify weekly report
  ☐ [enh] [feature] [security] setup sandboxing/RBAC (SELinux/Apparmor?)
  ☐ [enh] [feature] Find e10s and/or Webextensions compatible addons for Firefox (https://addons.mozilla.org/en-US/firefox/search/?tag=firefox57)
  ☐ [enh] use plymouth during live boot
  ☐ [enh] [debian] package all unpackaged software (includes.chroot/usr...), or send patches upstream when possible

 * https://github.com/MrS0m30n3/youtube-dl-gui/releases
 * https://github.com/mank319/Go-For-It
 * https://launchpad.net/light-locker-settings http://archive.ubuntu.com/ubuntu/pool/universe/l/light-locker-settings/
 * https://github.com/dequis/purple-facebook/wiki http://download.opensuse.org/repositories/home:/jgeboski/Debian_9.0/amd64/
 * http://ppa.launchpad.net/numix/ppa/ubuntu/pool/main/n/  https://numixproject.org
 * https://github.com/snwh/paper-gtk-theme http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=862403 http://ppa.launchpad.net/snwh/pulp/ubuntu/pool/main/p/
 * https://github.com/snwh/paper-cursor-theme http://ppa.launchpad.net/snwh/pulp/ubuntu/pool/main/p/
 * https://qwinff.github.io/ https://github.com/qwinff/qwinff/issues/18 https://github.com/qwinff/qwinff http://ppa.launchpad.net/lzh9102/qwinff/ubuntu/pool/main/q/
 * https://github.com/horst3180/Ceti-2-theme http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=862402 http://download.opensuse.org/repositories/home:/Horst3180/Debian_8.0/all/
 * package https://github.com/horst3180/Vertex-theme http://download.opensuse.org/repositories/home:/Horst3180/Debian_8.0/all/
 * Grammalecte French grammar checker for Firefox/Libreoffice https://www.dicollecte.org/grammalecte/telecharger.php http://bugs.debian.org/860579


```
