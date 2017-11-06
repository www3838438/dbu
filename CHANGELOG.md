# Change Log
All notable changes to this project will be documented in this file.  
The format is based on [Keep a Changelog](http://keepachangelog.com/).

## [v1.2](https://github.com/nodiscc/dbu/releases/tag/1.2) - UNPUBLISHED

No changes yet.

<!--
### Added
### Changed
### Removed
### Fixed
### Security
### Deprecated
-->

## [v1.1](https://github.com/nodiscc/dbu/releases/tag/1.1) - 2017-11-06

### Added

 * Add Virtualbox virtualization software
 * Add various development/utility packages: dnsmasq-base  ghi, pypi2deb, python-praw, firejail, firetools, dfc, fonts-hack-ttf, xfce4-pulseaudio-plugin, gimp-help-fr, libdvd-pkg, asciio
 * Add basic default configuration file for youtube-dl
 * Add a set of default configuration files + scripts for conky

### Changed

 * Replace xpad with xfce4-notes (notetaking application)
 * Change main UI font to Roboto
 * Replace jpegoptim/optipng with trimage (image file optimization)
 * Disable haveged and bluetooth services by default
 * Installer: remove disk partitioning scheme customizations, don't auto-try DHCP network configuration
 * Add 'genpass' alias (generate random password)
 * Update all packages to their latest versions
 * Update documentation

### Removed

 * Remove librecad, glabels, ocrfeeder, winetricks from default installed packages
 * Firefox addons: remove all 'legacy' add-ons, keep only e10s and WebExtensions compatible add-ons
 * Firefox addons: add Simple Youtube Repeater

### Fixed

 * Fix gpk-update-viewer not detecting available package updates (add missing apt-config-auto-update package)
 * Add missing i386 packages for PlayOnLinux/WINE
 * Fix live-build hooks execution (enable multiarch, purge unwanted packages, set default services status, set default desktop session)
 * Remove obsolete config files, cleanup various files, improve Makefile/build process
 * Remove i386 3rd-party packages downloads from Makefile

### Security

 * Security vulnerabilities in multiple Debian packages have been fixed (https://lists.debian.org/debian-security/)


## [v1.0.1](https://github.com/nodiscc/dbu/releases/tag/1.0.1) - 2017-07-03

### Removed

 * Removed gnome-boxes and dependency on GNOME Tracker file indexing (high resource usage)

### Fixed

 * Added missing gnome-settings-daemon and at packages
 * Cleanup in autostart entries

## [v1.0](https://github.com/nodiscc/dbu/releases/tag/1.0) - 2017-06-26

### Added

 * Development tools: added dh-make
 * Games/emulators: add mupen64plus-qt

### Changed

 * Update documentation
 * Improve iso image signing and release process

### Removed

 * Disabled redshift autostart, must now be enabled manually
 * Removed third party dependencies on conkyselect and fonts git repos

### Fixed

 * Fixed documentation generation script

### Deprecated

 * Removed obsolete libpam-smbpass package
 * Removed obsolete ffmpegthumbnailer workaround


## [v0.9n](https://github.com/nodiscc/dbu/releases/tag/0.9n) - 2017-06-19

### Added

 * Added xfce4-places-plugin
 * Support generating documentation pages from .deb packages

### Changed

 * Simplified XFCE4 panel configuration
 * Refactoring and cleanup in makefile/doc-generator.sh

### Removed

 * Removed first-run desktop setup script
 * Remove torrent creation sendto/helper

### Fixed

 * Fixed doc generation for samba package list 



## [v0.9m](https://github.com/nodiscc/dbu/releases/tag/0.9m) - 2017-06-17

### Added

 * Desktop environment: XFCE4 netload/weather/whiskermenu panel plugins, GNOME Boxes.
 * Development: added vera, gdb, iat, nrg2iso, git-mediawiki, python3-venv.
 * Multimedia: added QWinFF, added more VLC plugins (skins2,splitter,visualization,video-output,base,qt) and command-line variant.
 * System: Added GNOME Boxes virtualization tool.
 * Network: Added Samba file sharing server.
 * Added application launcher for Units.
 * Firefox addons: add Scrapbook X, Greasemonkey, Downthemall.

### Changed

 * Installer: let user select whether a network mirror should be used or not. This allows fully offline installation without having to manually cancel mirror selection.
 * Network mirrors: replaced country specific debian archive mirrors with deb.debian.net CDN. Allows faster packages download speeds regardless of the machine's geographic locations.
 * Updated 3rd party packages and user documentation, fix translations.
 * Removed most preset firewall rules, only preconfigured rules are now Bittorrent, Avahi and Samba.

### Removed

 * Replaced Synapse launcher with Kupfer.
 * Removed Remmina remote desktop client (removed from Debian Stretch).

### Fixed

 * Cleanup and improvements in documenation generation scripts.

## [v0.9k](https://github.com/nodiscc/dbu/releases/tag/0.9k) - 2017-06-02

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
