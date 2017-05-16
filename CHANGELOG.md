# Change Log
All notable changes to this project will be documented in this file.  
The format is based on [Keep a Changelog](http://keepachangelog.com/).

## [v0.99l](https://github.com/nodiscc/dbu/releases/tag/0.99l) - UNPUBLISHED

No changes yet.

<!--
### Added

### Changed

### Removed

### Fixed

### Security

### Deprecated
-->

## [v0.99k](https://github.com/nodiscc/dbu/releases/tag/0.99k) - 2017-06-02

Release final usable version. See [TODO.md](TODO.md) for remaining issues.

### Added

* Automate Debian Live system and installer build using live-build/Make
* Build for amd64 and i386 platforms, using Debian "Stretch" (testing) release
* Preconfigure isolinux bootloader (splash/menus) and Debian installer (disable popcon, noatime mount option, default groups, ext4 as default filesystem, clock, mirrors, homedir permissions, DHCP, generic setup tasks)
* Include memtest86+ and a Windows-compatible installer on bootable media
* Include non-free firmwares on the installation media
* Enable multiarch (x86 compatibility for x86_64 machines)
* Specify [571 packages to install](https://github.com/nodiscc/dbu/blob/master/doc/packages.md)
* Preconfigure services status, package management, bootloader, keyboard, firefox, font rendering, thunderbird, power management, display/session management, boot screen, sudo, sysctl, ufw, updatedb, locales, audacity, conky, elinks, gimp, mplayer, nano, pidgin, quodlibet, ssh, git, top, bash, audacious, autostarted applications, bleachbit, htop, openbox, pnmixer, synapse, Thunar, transmission, xfce4, xfce4-desktop, xfce4-panel, xfce4-terminal, ristretto, xfwm4, xsettings, xpad, redshift, Qt, file associations, gtksourceview, synapse, themes, thumbnailers, X11
* Automate download/installation of third-party software/addons/configuration files (Makefile, scripts/): 9 Firefox addons, 11 Thunderbird addons, 10 third-party .deb packages, 18 git repositories
* Automate generation of markdown documentation for installed packages, add main documentation (README, TODO, license, installation, usage, changelog, packages).
* Add simple GTK graphical helpers/launchers for simple tasks (initial setup wizard, password generation, torrent creation)

------------------------------------------------------------------
