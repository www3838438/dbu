addonsdir="config/includes.chroot/etc/iceweasel/profile/extensions"

all: update lbbuild

update: ffaddons tbaddons xpi packageschroot purpleplugins themes dotfiles

	
#update firefox addons
ffaddons:
	-rm $(addonsdir)/*.xpi
	#https://addons.mozilla.org/en-US/firefox/addon/downthemall/
	wget --directory-prefix=$(addonsdir) https://addons.mozilla.org/firefox/downloads/latest/201/addon-201-latest.xpi
	#https://addons.mozilla.org/en-US/firefox/addon/scrapbook-x/
	wget --directory-prefix=$(addonsdir) https://addons.mozilla.org/firefox/downloads/latest/521726/addon-521726-latest.xpi
	#https://addons.mozilla.org/fr/firefox/addon/add-to-search-bar/
	wget --directory-prefix=$(addonsdir) https://addons.mozilla.org/firefox/downloads/latest/3682/addon-3682-latest.xpi
	#https://addons.mozilla.org/en-us/firefox/addon/yet-another-context-search/
	wget --directory-prefix=$(addonsdir) https://addons.mozilla.org/firefox/downloads/latest/392483/addon-392483-latest.xpi
	#https://addons.mozilla.org/fr/firefox/addon/self-destructing-cookies/
	wget --directory-prefix=$(addonsdir) https://addons.mozilla.org/firefox/downloads/latest/415846/addon-415846-latest.xpi
	#https://addons.mozilla.org/en-US/firefox/addon/click-to-play-per-element/
	wget --directory-prefix=$(addonsdir) https://addons.mozilla.org/firefox/downloads/latest/457553/addon-457553-latest.xpi
	#https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/
	wget --directory-prefix=$(addonsdir) https://addons.mozilla.org/firefox/downloads/latest/607454/addon-607454-latest.xpi
	#https://www.eff.org/https-everywhere
	wget --directory-prefix=$(addonsdir) https://www.eff.org/files/https-everywhere-latest.xpi
	#https://addons.mozilla.org/en-us/firefox/addon/ssleuth/
	wget --directory-prefix=$(addonsdir) https://addons.mozilla.org/firefox/downloads/latest/479492/addon-479492-latest.xpi
	#https://addons.mozilla.org/fr/firefox/addon/greasemonkey/ 
	wget --directory-prefix=$(addonsdir) https://addons.mozilla.org/firefox/downloads/latest/748/addon-748-latest.xpi
	#https://addons.mozilla.org/en-US/firefox/addon/scrapbookx-converter/
	wget --directory-prefix=$(addonsdir) https://addons.mozilla.org/firefox/downloads/latest/536392/addon-536392-latest.xpi
	#https://addons.mozilla.org/en-US/firefox/addon/decentraleyes/
	wget --directory-prefix=$(addonsdir) https://addons.mozilla.org/firefox/downloads/latest/521554/addon-521554-latest.xpi
	#https://addons.mozilla.org/fr/firefox/addon/rss-icon-in-url-bar/
	wget --directory-prefix=$(addonsdir) https://addons.mozilla.org/firefox/downloads/file/339198/rss_icon_in_url_bar-1.5.2-sm+fx.xpi
	#https://addons.mozilla.org/fr/firefox/addon/canvasblocker/
	wget --directory-prefix=$(addonsdir) https://addons.mozilla.org/firefox/downloads/file/399286/canvasblocker-0.3.0-Release-fx.xpi
	#https://addons.mozilla.org/en-US/firefox/addon/clean-links/
	wget --directory-prefix=$(addonsdir) https://addons.mozilla.org/firefox/downloads/latest/317263/addon-317263-latest.xpi
	#https://addons.mozilla.org/fr/firefox/addon/new-tab-bookmarks/
	wget --directory-prefix=$(addonsdir) https://addons.mozilla.org/firefox/downloads/latest/628838/platform:2/addon-628838-latest.xpi
	#https://addons.mozilla.org/en-US/firefox/addon/password-exporter/
	wget --directory-prefix=$(addonsdir) https://addons.mozilla.org/firefox/downloads/latest/2848/addon-2848-latest.xpi
	#https://addons.mozilla.org/fr/firefox/addon/watch-with-mpv/
	wget --directory-prefix=$(addonsdir) https://addons.mozilla.org/firefox/downloads/file/368995/watch_with_mpv-0.1.0-alpha.3-fx.xpi


#rename xpis from their id
xpi:
	@for xpi in $$(find $(addonsdir) -name '*.xpi'); do \
	extid=$$(./scripts/get-xul-extension-id.sh "$$xpi"); echo "$$xpi - $$extid"; \
	mv "$$xpi" $(addonsdir)"$$extid".xpi ; \
	done

#update thunderbird addons TODO
tbaddons:
	#https://addons.mozilla.org/fr/thunderbird/addon/importexporttools/
	#https://addons.mozilla.org/fr/thunderbird/addon/todotxt-extension/
	#http://sogo.nu/download.html#/frontends
	#https://addons.mozilla.org/fr/thunderbird/addon/gmail-conversation-view/?src=ss
	#https://addons.mozilla.org/fr/thunderbird/addon/minimizetotray-revived/?src=cb-dl-users
	#https://addons.mozilla.org/fr/thunderbird/addon/categorymanager/?src=search
	#https://addons.mozilla.org/fr/thunderbird/addon/send-later-3/
	#https://addons.mozilla.org/fr/thunderbird/addon/additional-chat-protocols/
	#https://addons.mozilla.org/en-US/thunderbird/addon/automatic-export/
	#https://addons.mozilla.org/thunderbird/downloads/file/348080/importexporttools-3.2.4.1-sm+tb.xpi
	#http://www.sogo.nu/files/downloads/SOGo/Thunderbird/sogo-connector-31.0.2.xpi
	#https://addons.mozilla.org/thunderbird/downloads/latest/54035/addon-54035-latest.xpi
	#https://addons.mozilla.org/thunderbird/downloads/latest/12581/addon-12581-latest.xpi
	#https://addons.mozilla.org/thunderbird/downloads/latest/472193/addon-472193-latest.xpi
	#https://addons.mozilla.org/thunderbird/downloads/file/342656/send_later-4.4.4-sm+tb.xpi
	#https://addons.mozilla.org/thunderbird/downloads/latest/3740/addon-3740-latest.xpi?

#download non-debian chroot packages
packageschroot:
	-rm config/packages.chroot
	-mkdir -pv config/packages.chroot
	wget --directory-prefix=config/packages.chroot/ http://cz.archive.ubuntu.com/ubuntu/pool/universe/l/light-locker-settings/light-locker-settings_1.5.0-0ubuntu1.debian.tar.xz
	wget --directory-prefix=config/packages.chroot/ http://cz.archive.ubuntu.com/ubuntu/pool/universe/l/light-locker-settings/light-locker-settings_1.5.0-0ubuntu1.dsc
	wget --directory-prefix=config/packages.chroot/ http://cz.archive.ubuntu.com/ubuntu/pool/universe/l/light-locker-settings/light-locker-settings_1.5.0-0ubuntu1_all.deb
	wget --directory-prefix=config/packages.chroot/ http://cz.archive.ubuntu.com/ubuntu/pool/universe/l/light-locker-settings/light-locker-settings_1.5.0.orig.tar.bz2
	wget --directory-prefix=config/packages.chroot/ http://download.opensuse.org/repositories/home:/jgeboski/Debian_8.0/amd64/purple-facebook_20160409~2a24dff~66ee77378d82~110_amd64.deb
	wget --directory-prefix=config/packages.chroot/ http://download.opensuse.org/repositories/home:/jgeboski/Debian_8.0/i386/purple-facebook_20160409~2a24dff~66ee77378d82~110_i386.deb
	wget --directory-prefix=config/packages.chroot/ http://download.opensuse.org/repositories/home:/jgeboski/Debian_8.0/purple-facebook_20160409~2a24dff~66ee77378d82~110.dsc
	wget --directory-prefix=config/packages.chroot/ http://download.opensuse.org/repositories/home:/jgeboski/Debian_8.0/purple-facebook_20160409~2a24dff~66ee77378d82~110.tar.gz
	wget --directory-prefix=config/packages.chroot/ http://ppa.launchpad.net/numix/ppa/ubuntu/pool/main/n/numix-gtk-theme/numix-gtk-theme_2.4ubuntu1+477~201605151647~ubuntu16.10.1.dsc
	wget --directory-prefix=config/packages.chroot/ http://ppa.launchpad.net/numix/ppa/ubuntu/pool/main/n/numix-gtk-theme/numix-gtk-theme_2.4ubuntu1+477~201605151647~ubuntu16.10.1.tar.xz
	wget --directory-prefix=config/packages.chroot/ http://ppa.launchpad.net/numix/ppa/ubuntu/pool/main/n/numix-gtk-theme/numix-gtk-theme_2.4ubuntu1+477~201605151647~ubuntu16.10.1_all.deb
	wget --directory-prefix=config/packages.chroot/ http://ppa.launchpad.net/numix/ppa/ubuntu/pool/main/n/numix-icon-theme-bevel/numix-icon-theme-bevel_1.0+201410212340~8~ubuntu14.10.1.dsc
	wget --directory-prefix=config/packages.chroot/ http://ppa.launchpad.net/numix/ppa/ubuntu/pool/main/n/numix-icon-theme-bevel/numix-icon-theme-bevel_1.0+201410212340~8~ubuntu14.10.1.tar.xz
	wget --directory-prefix=config/packages.chroot/ http://ppa.launchpad.net/numix/ppa/ubuntu/pool/main/n/numix-icon-theme-bevel/numix-icon-theme-bevel_1.0+201410212340~8~ubuntu14.10.1_all.deb
	wget --directory-prefix=config/packages.chroot/ http://ppa.launchpad.net/numix/ppa/ubuntu/pool/main/n/numix-icon-theme-circle/numix-icon-theme-circle_1.0.2+5~201511012129~ubuntu16.04.1.dsc
	wget --directory-prefix=config/packages.chroot/ http://ppa.launchpad.net/numix/ppa/ubuntu/pool/main/n/numix-icon-theme-circle/numix-icon-theme-circle_1.0.2+5~201511012129~ubuntu16.04.1.tar.xz
	wget --directory-prefix=config/packages.chroot/ http://ppa.launchpad.net/numix/ppa/ubuntu/pool/main/n/numix-icon-theme-circle/numix-icon-theme-circle_1.0.2+5~201511012129~ubuntu16.04.1_all.deb
	wget --directory-prefix=config/packages.chroot/ http://ppa.launchpad.net/numix/ppa/ubuntu/pool/main/n/numix-icon-theme/numix-icon-theme_0.3+794~201605151847~ubuntu16.10.1.dsc
	wget --directory-prefix=config/packages.chroot/ http://ppa.launchpad.net/numix/ppa/ubuntu/pool/main/n/numix-icon-theme/numix-icon-theme_0.3+794~201605151847~ubuntu16.10.1.tar.xz
	wget --directory-prefix=config/packages.chroot/ http://ppa.launchpad.net/numix/ppa/ubuntu/pool/main/n/numix-icon-theme/numix-icon-theme_0.3+794~201605151847~ubuntu16.10.1_all.deb
	wget --directory-prefix=config/packages.chroot/ http://ppa.launchpad.net/snwh/pulp/ubuntu/pool/main/p/paper-gtk-theme/paper-gtk-theme_2.0+r227~daily~ubuntu16.04.1.dsc
	wget --directory-prefix=config/packages.chroot/ http://ppa.launchpad.net/snwh/pulp/ubuntu/pool/main/p/paper-gtk-theme/paper-gtk-theme_2.0+r227~daily~ubuntu16.04.1.tar.gz
	wget --directory-prefix=config/packages.chroot/ http://ppa.launchpad.net/snwh/pulp/ubuntu/pool/main/p/paper-gtk-theme/paper-gtk-theme_2.0+r227~daily~ubuntu16.04.1_all.deb
	wget --directory-prefix=config/packages.chroot/ http://ppa.launchpad.net/snwh/pulp/ubuntu/pool/main/p/paper-icon-theme/paper-cursor-theme_1.3+r386~daily~ubuntu16.04.1_all.deb
	wget --directory-prefix=config/packages.chroot/ http://ppa.launchpad.net/snwh/pulp/ubuntu/pool/main/p/paper-icon-theme/paper-icon-theme_1.3+r386~daily~ubuntu16.04.1.dsc
	wget --directory-prefix=config/packages.chroot/ http://ppa.launchpad.net/snwh/pulp/ubuntu/pool/main/p/paper-icon-theme/paper-icon-theme_1.3+r386~daily~ubuntu16.04.1.tar.xz
	wget --directory-prefix=config/packages.chroot/ http://ppa.launchpad.net/snwh/pulp/ubuntu/pool/main/p/paper-icon-theme/paper-icon-theme_1.3+r386~daily~ubuntu16.04.1_all.deb
	wget --directory-prefix=config/packages.chroot/ http://download.opensuse.org/repositories/home:/Horst3180/Debian_8.0/all/arc-theme_1459454111.c561afa_all.deb
	wget --directory-prefix=config/packages.chroot/ http://download.opensuse.org/repositories/home:/Horst3180/Debian_8.0/all/arc-theme-solid_1459454111.c561afa_all.deb
	wget --directory-prefix=config/packages.chroot/ http://download.opensuse.org/repositories/home:/Horst3180/Debian_8.0/all/ceti-2-theme_1442961272.9fe3d9f_all.deb
	wget --directory-prefix=config/packages.chroot/ http://download.opensuse.org/repositories/home:/Horst3180/Debian_8.0/all/vertex-theme_1459280359.d828032_all.deb
	wget --directory-prefix=config/packages.chroot/ http://ppa.launchpad.net/mank319/go-for-it/ubuntu/pool/main/g/go-for-it/go-for-it_1.4.6-0~127~ubuntu15.10.1_i386.deb
	wget --directory-prefix=config/packages.chroot/ http://ppa.launchpad.net/mank319/go-for-it/ubuntu/pool/main/g/go-for-it/go-for-it_1.4.6-0~127~ubuntu15.10.1_amd64.deb
	wget --directory-prefix=config/packages.chroot/ http://ppa.launchpad.net/mank319/go-for-it/ubuntu/pool/main/g/go-for-it/go-for-it_1.4.6-0~127~ubuntu15.10.1.tar.xz
	wget --directory-prefix=config/packages.chroot/ http://ppa.launchpad.net/mank319/go-for-it/ubuntu/pool/main/g/go-for-it/go-for-it_1.4.6-0~127~ubuntu15.10.1.dsc
	wget --directory-prefix=config/packages.chroot/ http://ppa.launchpad.net/nilarimogard/webupd8/ubuntu/pool/main/y/youtube-dlg/youtube-dlg_0.3.8-1~webupd8~xenial3.debian.tar.xz
	wget --directory-prefix=config/packages.chroot/ http://ppa.launchpad.net/nilarimogard/webupd8/ubuntu/pool/main/y/youtube-dlg/youtube-dlg_0.3.8-1~webupd8~xenial3.dsc
	wget --directory-prefix=config/packages.chroot/ http://ppa.launchpad.net/nilarimogard/webupd8/ubuntu/pool/main/y/youtube-dlg/youtube-dlg_0.3.8-1~webupd8~xenial3_all.deb
	wget --directory-prefix=config/packages.chroot/ http://ppa.launchpad.net/nilarimogard/webupd8/ubuntu/pool/main/y/youtube-dlg/youtube-dlg_0.3.8.orig.tar.gz


# download pidgin plugins
purpleplugins:
	-rm -r config/includes.chroot/usr/lib/purple-2/
	mkdir -pv config/includes.chroot/usr/lib/purple-2/
	wget --directory-prefix=config/includes.chroot/usr/lib/purple-2/ \
	https://github.com/EionRobb/pidgin-opensteamworks/releases/download/1.6.1/libsteam64-1.6.1.so \
	https://github.com/EionRobb/pidgin-opensteamworks/releases/download/1.6.1/libsteam-1.6.1.so

# download gtk/wm themes
themes:
	-rm -rf config/includes.chroot/usr/share/themes/
	mkdir -pv config/includes.chroot/usr/share/themes/
	git clone https://github.com/shimmerproject/Albatross config/includes.chroot/usr/share/themes/Albatross
	git clone https://github.com/shimmerproject/Blackbird config/includes.chroot/usr/share/themes/Blackbird
	git clone https://github.com/shimmerproject/Bluebird config/includes.chroot/usr/share/themes/Bluebird
	git clone https://github.com/shimmerproject/Greybird config/includes.chroot/usr/share/themes/Greybird
	git clone https://github.com/shimmerproject/Numix config/includes.chroot/usr/share/themes/Numix
	git clone https://github.com/shimmerproject/Orion config/includes.chroot/usr/share/themes/Orion
	git clone https://github.com/satya164/Evolve config/includes.chroot/usr/share/themes/Evolve
	git clone https://github.com/xyl0n/iris config/includes.chroot/usr/share/themes/iris
	git clone https://github.com/xyl0n/iris-light config/includes.chroot/usr/share/themes/iris-light
	git clone https://github.com/BunsenLabs/deb8-theme config/includes.chroot/usr/share/themes/deb8
	git clone https://github.com/lassekongo83/zuki-themes tmp-zuki-themes
	mv tmp-zuki-themes/Zukitre tmp-zuki-themes/Zukitwo config/includes.chroot/usr/share/themes/
	rm -rf tmp-zuki-themes

# download misc configuration files
dotfiles:
	-rm -rf config/includes.chroot/etc/skel/.nano config/includes.chroot/etc/skel/.conky config/includes.chroot/etc/iceweasel/pref config/usr/share/fonts/
	-mkdir -pv config/includes.chroot/etc/skel/ config/includes.chroot/etc/iceweasel/
	git clone https://github.com/serialhex/nano-highlight config/includes.chroot/etc/skel/.nano
	git clone --recursive https://github.com/nodiscc/conkyselect config/includes.chroot/etc/skel/.conky
	git clone -b dbu https://github.com/nodiscc/user.js config/includes.chroot/etc/iceweasel/pref
	git clone https://github.com/nodiscc/fonts config/usr/share/fonts/
	
	git clone https://github.com/az0/cleanerml/ tmp-cleanerml
	-rm -rf config/includes.chroot/usr/share/bleachbit/
	mkdir -p config/includes.chroot/usr/share/bleachbit/
	mv tmp-cleanerml/release config/includes.chroot/usr/share/bleachbit/cleaners
	rm -rf tmp-cleanerml

lbbuild:
	sudo lb clean --all
	sudo lb config
	sudo lb build

#TODO add GPG keys for verification, eg wget --directory-prefix=build/config/packages.chroot/ -O- https://jgeboski.github.io/obs.key | sudo apt-key add -
#TODO https://greasyfork.org/en/scripts/1190-flickr-original-link
#TODO https://greasyfork.org/en/scripts/494-youtube-auto-buffer-auto-hd
#TODO https://openuserjs.org/scripts/elundmark/Torrentz_All-in-One
#TODO install conky config GUI to target system (test hooks/make-install-conkyselect.hook.chroot)