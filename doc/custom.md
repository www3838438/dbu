#### Customize/Build your own

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


