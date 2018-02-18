# Base system and hardware support

__ConsoleKit PAM module__

```

ConsoleKit is a system daemon for tracking what users are logged
into the system and how they interact with the computer (e.g.
which keyboard and mouse they use).

This package provides a PAM module which can be used for console logins.
Graphical login managers should talk to ConsoleKit directly.

```

[![](https://screenshots.debian.net/thumbnail-with-version/libpam-ck-connector/9001)](https://screenshots.debian.net/screenshot-with-version/libpam-ck-connector/9001)



**[Homepage](https://www.freedesktop.org/wiki/Software/ConsoleKit)**

### Installed packages

* [libpam-ck-connector](https://packages.debian.org/stretch/libpam-ck-connector) `0.4.6-6` - ConsoleKit PAM module
* [libpam-systemd](https://packages.debian.org/stretch/libpam-systemd) `232-25+deb9u1` - system and service manager - PAM module
* [systemd](https://packages.debian.org/stretch/systemd) `232-25+deb9u1` - system and service manager
* [consolekit](https://packages.debian.org/stretch/consolekit) `0.4.6-6` - framework for defining and tracking users, sessions and seats
* [user-setup](https://packages.debian.org/stretch/user-setup) `1.67` - Set up initial user and password
* [os-prober](https://packages.debian.org/stretch/os-prober) `1.76~deb9u1` - utility to detect other OSes on a set of drives
* [preload](https://packages.debian.org/stretch/preload) `0.6.4-2+b1` - adaptive readahead daemon
* [ulatencyd](https://packages.debian.org/stretch/ulatencyd) `0.5.0-9+b1` - scriptable latency regulator using cgroups (server)
* [debian-archive-keyring](https://packages.debian.org/stretch/debian-archive-keyring) `2017.5` - GnuPG archive keys of the Debian archive
* [debian-keyring](https://packages.debian.org/stretch/debian-keyring) `2017.05.28` - GnuPG keys of Debian Developers and Maintainers
* [haveged](https://packages.debian.org/stretch/haveged) `1.9.1-5+deb9u1` - Linux entropy source using the HAVEGE algorithm
* [ntp](https://packages.debian.org/stretch/ntp) `1:4.2.8p10+dfsg-3+deb9u1` - Network Time Protocol daemon and utility programs
* [initramfs-tools](https://packages.debian.org/stretch/initramfs-tools) `0.130` - generic modular initramfs generator (automation)
* [dkms](https://packages.debian.org/stretch/dkms) `2.3-2` - Dynamic Kernel Module Support Framework
* [linux-headers-amd64](https://packages.debian.org/stretch/linux-headers-amd64) `4.9+80+deb9u3` - Header files for Linux amd64 configuration (meta-package)
* [build-essential](https://packages.debian.org/stretch/build-essential) `12.3` - Informational list of build-essential packages
* [module-assistant](https://packages.debian.org/stretch/module-assistant) `0.11.9` - tool to make module package creation easier
* [irqbalance](https://packages.debian.org/stretch/irqbalance) `1.1.0-2.3` - Daemon to balance interrupts for SMP systems
* [console-setup](https://packages.debian.org/stretch/console-setup) `1.164` - console font and keymap setup program
* [grub2](https://packages.debian.org/stretch/grub2) `2.02~beta3-5` - GRand Unified Bootloader, version 2 (dummy package)
* [sudo](https://packages.debian.org/stretch/sudo) `1.8.19p1-2.1` - Provide limited super user privileges to specific users

### Related packages

 * [kexec-tools](https://packages.debian.org/stretch/kexec-tools) tools to support fast kexec reboots
