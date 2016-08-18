# dbu

Custom [Debian GNU/Linux](http://www.debian.org/) installer and live system.

[Debian GNU/Linux](https://en.wikipedia.org/wiki/Debian) is a major and widely used [Linux distribution](https://en.wikipedia.org/wiki/Linux_distribution). [GNU/Linux](https://en.wikipedia.org/wiki/Linux) is a [Free](https://en.wikipedia.org/wiki/Free_software) and open source [operating system](https://en.wikipedia.org/wiki/Operating_system).

**[Download ISO (64-bit)](live-image-amd64.hybrid.iso)**

 * Preconfigured for desktop machines (installed software/configuration)
 * Runs as a Live system or as an offline installer
 * Based on Debian 8 Jessie (stable Debian release).


### Required Hardware

    Computer with x86 or x86_64 processor
    Memory: min 512MB, recommended 1GB+
    Storage: 10+GB (system), 10+GB (user data).
    2GB+ USB drive or DVD-R for the installation media
    Optional: Internet access
    Optional: external backup storage


### Documentation

 * [Installation](doc/install.md)
 * [Usage](doc/usage.md)
 * [Installed software](doc/packages.md)
 * [More documentation](doc/more-docs.md)
 * [Bugs/TODO](TODO.md)


### About

This project is aimed at users who want to install a fully configured operating system + common utilities for personal computers without going through the procedure of installing and setting up Debian manually. System administrators and advanced users may want to customize the live-build configuration before rebuilding an image (see below). The installer should run as much unattended as possible. The resulting system should run on ~5 years old machines with a focus on stability, security, performance and ease of use. It should only rely on Free and Open Source Software as defined in the DFSG. It is intended as a quick way to reinstall an OS on old computers, and as a basic live-build configuration example for similar projects.


#### Contributing

For each software project you use, you can

 * Help testing the software, report bugs and help debugging.
 * Write translations.
 * Write documentation.
 * Contribute code.
 * Provide user support on forums, discussion channels, ...
 * Create templates and audio/video resources under Free licenses.
 * Donate to software projects.

#### Reporting bugs

When reporting a bug, please include the following information:

>     * What are you trying to do?
>     * When does the problem happen (actions, commands...) ?
>     * What is the expected behavior?
>     * What happens instead?
>     * Version of the software and operating system/Linux distribution

Each software's homepage has information on how to report bugs

Use the [Debian Bug Tracking System](https://www.debian.org/Bugs/) for bugs in Debian packages.


### Customize/Build your own

 * `live-build` is used to build the system. Install the `live-build` package.
 * Dependencies are downloaded and setup from the [`Makefile`](../Makefile). To run the build process with the default configuration, run `make all` from the root of this repository.
 * You must build from the same distribution as the target distribution (build *stable* systems on a build machine running *stable*, *testing* on a machine running *testing*...)

```
DIRECTORIES

.
├── auto                        #main build configuration
├── config
│   ├── archives                #package mirrors/repositories
│   ├── hooks                   #scripts to run during build
│   ├── includes.binary         #files to include directly in the ISO filesystem
│   ├── includes.chroot         #files to include in the live system's filesystem
│   ├── includes.installer      #files to include in the installer's filesystem
│   ├── package-lists           #packages to install on live system/place in installation media's pool/ directory
│   ├── packages.chroot         #.deb packages to install on live system
│   └── task-lists              #tasksel tasks to install on live system
├── doc     #user documentation
├── scripts #scripts used to generate build configuration, documentation...
└── Makefile #main build automation, dependencies management, etc

```

* [Live Systems manual](https://debian-live.alioth.debian.org/live-manual/stable/manual/html/live-manual.en.html))
* [`man lb clean`](https://manpages.debian.org/cgi-bin/man.cgi?query=lb_clean&sektion=1&apropos=0&manpath=Debian+8+jessie&locale=)
* [`man lb config`](https://manpages.debian.org/cgi-bin/man.cgi?query=lb_config&sektion=1&apropos=0&manpath=Debian+8+jessie&locale=)
* [`man lb build`](https://manpages.debian.org/cgi-bin/man.cgi?query=lb_build&sektion=1&apropos=0&manpath=Debian+8+jessie&locale=)



### License

[GNU GPLv3](LICENSE). Documentation under [CreativeCommons Attribution-ShareAlike](LICENSE)