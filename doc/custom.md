### Customize/Build your own

 * You must build from the same distribution as the target distribution (build *stable* systems on a build machine running Debian *stable*, *testing* systems on a machine running Debian *testing*...)
 * [`live-build`](https://www.debian.org/devel/debian-live/) is used to build the live system/installer/ISO image.
 * Install the `make` and `git` packages.
 * Run `git clone https://github.com/nodiscc/dbu`
 * To run the build process with the default configuration, run `make all` from the root of the git repository.


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


#### Makefile

The following targets are available:

```
make all: perform all build steps
make buildenv: install build tools
make clean:
make update:
    make ffaddons:
    make tbaddons:
    make packageschroot:
    make purpleplugins:
    make themes:
    make dotfiles:
make xpi:
make documentation:
make lbbuild:
```

##### config/includes.chroot/

##### config/package-lists/


    *.chroot: packages to be installed on the resulting image/system (live or installed)
    *.binary: packages to be added to the resulting ISO filesystem (as an offline package repository - pool/ directory)
 
### Package documentation generation
 
live-build ignores lines starting with `#` in package lists. Additional data in these files is used by the documentation generation script at `scripts/doc-generator.sh`:

 * #Name: Name for the package list (eg. Document Viewer)
 * #Screenshot: package name to lookup on screenshots.debian.net
 * #Cat: Category for the package list (eg Office)
 * #Desc: Package name to use for the description. If this is omitted, the description for first package in the list is used.
 * #Alt: name of an alternative package, or other package related to this list
 * #Res: URL to a resource/help link to add on the package doc page (using the target webpage title)

### Changing the locale/language

The live system is built with `fr_FR.UTF_8` (french) as default locale. If you want to define the locale to english at boot time, while on the syslinux (boot) menu, hightlight the `Live (amd64)` entry, press the TAB key, and replace `locale=fr_FR.UTF-8` with `locale=en_US.UTF-8` and press Enter.

Not that only these 2 locales (english and french) are pre-generated, other languages have to be manually added to the build configuration, and the ISO rebuilt.
