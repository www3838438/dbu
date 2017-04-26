### Customize/Build your own

**Building with the default configuration**

 * You must build from the same distribution as the target distribution (build *stable* systems on a build machine running Debian *stable*, *testing* systems on a machine running Debian *testing*...)
 * [`live-build`](https://www.debian.org/devel/debian-live/) is used to build the live system/installer/ISO image.
 * Install the `make` and `git` packages.
 * Run `git clone https://github.com/nodiscc/dbu`
 * To run the build process with the default configuration, run `make all` from the root of the git repository.

The full live-build documentation can be found at `/usr/share/doc/live-manual/pdf/live-manual.portrait.en.a4.pdf.gz`

**Building with a custom configuration**

The build process and resulting live system configuration is controlled through
different config files and directories in the repo:

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
make buildenv: install tools required for building the system
make clean: clean files downloaded during the build process
make update: download third party files/software
    make ffaddons: download firefox addons
    make tbaddons: download thunderbird addons
    make packageschroot: download third-party .deb packages
    make purpleplugins: download pidgin plugins
    make themes: download extra gtk/wm themes
    make dotfiles: download extra configuration files
make xpi: rename firefox addons to make them auto-installable
make documentation: generate packages documentation (package lists to Markdown)
make lbbuild: run the live system build process

```

##### config/includes.chroot/

Files and directories placed here will be copied to the live system during build.
This is useful if you need to include modified configuration or data files. Extra
files (that do not belong to an existing Debian package) should preferably be
dirstributed through a custom package (see below).


##### config/package-lists/

Contains lists of packages to install/copy to resulting live image:

    *.chroot: packages to be installed on the resulting image/system (live or installed)
    *.binary: packages to be added to the resulting ISO filesystem (to use as an offline repository/mirror)
              not required for the live system to work

Lines commented out (starting with `#`) will be ignored, except a few keywords
like `#if ...` to manage conditionals. Some keywords can be used to generate
end-user package documentation pages (see below).

##### config/packages.chroot

Place any custom .deb package here and it will be installed to the live system. 
This is useful if a package 1. is not available in Debian (see requests for
packaging  at http://wnpp.debian.net/) and 2. you don't want to add a third-party
repository to your APT sources list that could distribute broken or otherwise
malicious upgrades at a later time (repository maintainers have root access to 
your machine through upgrades).

Keep in mind that packages placed here will _not_ receive upgrades through APT,
unless someone packages it in Debian archives.

Currently all custom packages are downloaded from the Makefile.
Putting binary .deb packages under git version control should be avoided.
 
### Documentation

#### Packages documentation
 
live-build ignores lines starting with `#` in package lists. 
Custom comment fields in package lists are used to control end-user package
documentation generation (`scripts/doc-generator.sh`). The resulting markdown
files in `doc/packages/*, doc/packages.md` is generated automatically (`make doc`)
and should not be edited manually (edit package lists instead).


 * #Name: Name for the package list (eg. Document Viewer)
 * #Screenshot: package name to lookup on screenshots.debian.net
 * #Cat: Category for the package list (eg Office)
 * #Desc: Package name to use for the description. If this is omitted, the description for first package in the list is used.
 * #Alt: name of an alternative package, or other package related to this list
 * #Res: URL to a resource/help link to add on the package doc page (using the target webpage title)
 * #NoDescription: putting this line in any package list will remove the long/short description from the resulting markdown file

#### Main documentation

Markdown files directly under `doc` directory, as well as the main `README.md`
and `TODO.md` files can be edited freely.

### Changing the locale/language

The live system is built with `fr_FR.UTF_8` (french) as default locale. If you 
want to define the locale to english at boot time, while on the syslinux (boot)
menu, hightlight the `Live (amd64)` entry, press the TAB key, and replace
`locale=fr_FR.UTF-8` with `locale=en_US.UTF-8` and press Enter.

Not that only these 2 locales (english and french) are pre-generated, other languages
have to be manually added to the build configuration, and the ISO rebuilt.
