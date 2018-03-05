# Change Log

All notable changes to this project will be documented in this file.  
The format is based on [Keep a Changelog](http://keepachangelog.com/).

## [v1.4](https://github.com/nodiscc/dbu/releases/tag/1.4) - 2018-03-05

### Added

Build an ISO image using live-build:
 - build an iso-hybrid image suitable for removable drives and/or CD/DVD
 - add an option to permanenty install the live system to disk, using the graphical installer
 - build from Debian 9 Strech repositories (using main, contrib and non-free archive sections)
 - support the amd64 CPU architecture, enable support for i386 packages (multiarch)
 - enable Debian backports, security and updates repositories
 - disable installation of 'recommended' packages
 - include device firmwares in the ISO image and the live system
 - include memtest86+ in the ISO image
 - include an installer launcher for Windows computers in the ISO image
 - other build options: HTTPS apt transport, SHA256 checksums, no separate image for source packages, boot parameters, debconf options, logging, cleanup
 - pre-answer (preseed) some installer questions
 - rewrite the git history/changelog to get a readable log. An [archive of the old changelog](https://github.com/dbu/blob/master/doc/changelog-archive.md) is available.

Include ~600 packages by default:
 - desktop environment based on Xfce
 - office utilities, document reading and editing
 - web browsing, file transfer, download and synchronisation, messaging
 - audio/video playback, creation and editing tools
 - base hardware, display and audio systems, apparmor
 - file management, system, hardware and network configuration/diagnostic utilities
 - various graphical and command line utilities for common tasks
 - Virtualization/other platforms support (Virtualbox, WINE)
 - remove a few unwanted default Debian packages from the system, disable some services by default
 - add documentation for general usage, installation and default packages. See the [README](https:/github.com/nodiscc/dbu/blob/master/README.md).

Other changes to default Debian installation:
 - add a few .desktop launchers, better integration for the Send to... menu, default file associations, 
 - add default configuration for terminal, desktop, boot splash, syntax highlighting, conky, and many other utilities.
 - configure touchpad scrolling, file indexing, sudo behavior, sysctl, localization, power saving, package management, GRUB boot options, keyboard, UFW firewall
 - add a local caching DNS resolver (dnsmasq-base) for NetworkManager
 - enable AppArmor mandatory access control system
 - see the [commit log](https://github.com/nodiscc/dbu/commits) and git repository contents for more details.

<!--
### Changed
### Removed
### Fixed
### Security
### Deprecated
-->
