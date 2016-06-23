addonsdir="config/includes.chroot/etc/iceweasel/profile/extensions/"
#addonsdir="/usr/share/firefox-esr/distribution/extensions/" #stretch, used for default profile creation
#addonsdir="/usr/lib/firefox-esr/browser/extensions/" #stretch, system-wide
tbaddonsdir="config/includes.chroot/etc/icedove/extensions/"
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
	#https://addons.mozilla.org/en-US/firefox/addon/https-everywhere/
	wget --directory-prefix=$(addonsdir) https://addons.mozilla.org/firefox/downloads/latest/229918/addon-229918-latest.xpi
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
	mv $(addonsdir)/addon-3682-latest.xpi $(addonsdir)/add-to-searchbox@maltekraus.de #workaround, script doesn't work on this addon
	@for xpi in $$(find $(addonsdir) -name '*.xpi'); do \
	extid=$$(./scripts/get-xul-extension-id.sh "$$xpi"); echo "$$xpi - $$extid"; \
	mv "$$xpi" $(addonsdir)"$$extid".xpi ; \
	done
	mv $(addonsdir)/add-to-searchbox@maltekraus.de $(addonsdir)/add-to-searchbox@maltekraus.de.xpi #workaround, 2nd part

#update thunderbird addons TODO
tbaddons:
	#https://addons.mozilla.org/en-US/thunderbird/addon/gmail-conversation-view/
	wget --directory-prefix=$(tbaddonsdir) https://addons.mozilla.org/thunderbird/downloads/latest/54035/addon-54035-latest.xpi
	#https://addons.mozilla.org/fr/thunderbird/addon/importexporttools/
	wget --directory-prefix=$(tbaddonsdir) https://addons.mozilla.org/thunderbird/downloads/file/348080/addon-348080-latest.xpi
	#https://addons.mozilla.org/en-US/thunderbird/addon/lightning/
	wget --directory-prefix=$(tbaddonsdir) https://addons.mozilla.org/thunderbird/downloads/latest/2313/platform:2/addon-2313-latest.xpi
	#https://addons.mozilla.org/en-US/thunderbird/addon/quote-colors/
	wget --directory-prefix=$(tbaddonsdir) https://addons.mozilla.org/thunderbird/downloads/latest/170/addon-170-latest.xpi
	#https://addons.mozilla.org/en-US/thunderbird/addon/enigmail/
	wget --directory-prefix=$(tbaddonsdir) https://addons.mozilla.org/thunderbird/downloads/latest/71/addon-71-latest.xpi
	#http://sogo.nu/download.html#/frontends
	wget --directory-prefix=$(tbaddonsdir) http://www.sogo.nu/files/downloads/SOGo/Thunderbird/sogo-connector-31.0.3.xpi
	#https://addons.mozilla.org/fr/thunderbird/addon/categorymanager/
	wget --directory-prefix=$(tbaddonsdir) https://addons.mozilla.org/thunderbird/downloads/latest/472193/addon-472193-latest.xpi
	#https://addons.mozilla.org/en-US/thunderbird/addon/duplicate-contact-manager/
	wget --directory-prefix=$(tbaddonsdir)  https://addons.mozilla.org/thunderbird/downloads/latest/2505/addon-2505-latest.xpi
	#https://addons.mozilla.org/en-US/thunderbird/addon/contact-tabs/
	wget --directory-prefix=$(tbaddonsdir) https://addons.mozilla.org/thunderbird/downloads/latest/306600/addon-306600-latest.xpi
	#https://addons.mozilla.org/en-US/thunderbird/addon/send-later-3/
	wget --directory-prefix=$(tbaddonsdir) https://addons.mozilla.org/thunderbird/downloads/file/423919/addon-423919-latest.xpi
	#https://addons.mozilla.org/fr/thunderbird/addon/todotxt-extension/
	wget --directory-prefix=$(tbaddonsdir) https://addons.mozilla.org/thunderbird/downloads/latest/650068/platform:2/addon-650068-latest.xpi



#download non-debian chroot packages
packageschroot:
	-rm -r config/packages.chroot
	-mkdir -pv config/packages.chroot
	wget --directory-prefix=config/packages.chroot/ http://cz.archive.ubuntu.com/ubuntu/pool/universe/l/light-locker-settings/light-locker-settings_1.5.0-0ubuntu1.debian.tar.xz
	wget --directory-prefix=config/packages.chroot/ http://cz.archive.ubuntu.com/ubuntu/pool/universe/l/light-locker-settings/light-locker-settings_1.5.0-0ubuntu1.dsc
	wget --directory-prefix=config/packages.chroot/ http://cz.archive.ubuntu.com/ubuntu/pool/universe/l/light-locker-settings/light-locker-settings_1.5.0-0ubuntu1_all.deb
	wget --directory-prefix=config/packages.chroot/ http://cz.archive.ubuntu.com/ubuntu/pool/universe/l/light-locker-settings/light-locker-settings_1.5.0.orig.tar.bz2
	wget --directory-prefix=config/packages.chroot/ http://download.opensuse.org/repositories/home:/jgeboski/Debian_8.0/amd64/purple-facebook_20160409~2a24dff~66ee77378d82~110_amd64.deb
	wget --directory-prefix=config/packages.chroot/ http://download.opensuse.org/repositories/home:/jgeboski/Debian_8.0/i386/purple-facebook_20160409~2a24dff~66ee77378d82~110_i386.deb
	wget --directory-prefix=config/packages.chroot/ http://download.opensuse.org/repositories/home:/jgeboski/Debian_8.0/purple-facebook_20160409~2a24dff~66ee77378d82~110.dsc
	wget --directory-prefix=config/packages.chroot/ http://download.opensuse.org/repositories/home:/jgeboski/Debian_8.0/purple-facebook_20160409~2a24dff~66ee77378d82~110.tar.gz
	wget --directory-prefix=config/packages.chroot/ http://ppa.launchpad.net/numix/ppa/ubuntu/pool/main/n/numix-gtk-theme/numix-gtk-theme_2.6.0+508~201606190701~ubuntu16.10.1.dsc
	wget --directory-prefix=config/packages.chroot/ http://ppa.launchpad.net/numix/ppa/ubuntu/pool/main/n/numix-gtk-theme/numix-gtk-theme_2.6.0+508~201606190701~ubuntu16.10.1.tar.xz
	wget --directory-prefix=config/packages.chroot/ http://ppa.launchpad.net/numix/ppa/ubuntu/pool/main/n/numix-gtk-theme/numix-gtk-theme_2.6.0+508~201606190701~ubuntu16.10.1_all.deb
	wget --directory-prefix=config/packages.chroot/ http://ppa.launchpad.net/numix/ppa/ubuntu/pool/main/n/numix-icon-theme-bevel/numix-icon-theme-bevel_1.0+201410212340~8~ubuntu14.10.1.dsc
	wget --directory-prefix=config/packages.chroot/ http://ppa.launchpad.net/numix/ppa/ubuntu/pool/main/n/numix-icon-theme-bevel/numix-icon-theme-bevel_1.0+201410212340~8~ubuntu14.10.1.tar.xz
	wget --directory-prefix=config/packages.chroot/ http://ppa.launchpad.net/numix/ppa/ubuntu/pool/main/n/numix-icon-theme-bevel/numix-icon-theme-bevel_1.0+201410212340~8~ubuntu14.10.1_all.deb
	wget --directory-prefix=config/packages.chroot/ http://ppa.launchpad.net/numix/ppa/ubuntu/pool/main/n/numix-icon-theme-circle/numix-icon-theme-circle_1.0.2+6~201605271707~ubuntu16.10.1.dsc
	wget --directory-prefix=config/packages.chroot/ http://ppa.launchpad.net/numix/ppa/ubuntu/pool/main/n/numix-icon-theme-circle/numix-icon-theme-circle_1.0.2+6~201605271707~ubuntu16.10.1.tar.xz
	wget --directory-prefix=config/packages.chroot/ http://ppa.launchpad.net/numix/ppa/ubuntu/pool/main/n/numix-icon-theme-circle/numix-icon-theme-circle_1.0.2+6~201605271707~ubuntu16.10.1_all.deb
	wget --directory-prefix=config/packages.chroot/ http://ppa.launchpad.net/numix/ppa/ubuntu/pool/main/n/numix-icon-theme/numix-icon-theme_0.3+812~201606210232~ubuntu16.10.1.dsc
	wget --directory-prefix=config/packages.chroot/ http://ppa.launchpad.net/numix/ppa/ubuntu/pool/main/n/numix-icon-theme/numix-icon-theme_0.3+812~201606210232~ubuntu16.10.1.tar.xz
	wget --directory-prefix=config/packages.chroot/ http://ppa.launchpad.net/numix/ppa/ubuntu/pool/main/n/numix-icon-theme/numix-icon-theme_0.3+812~201606210232~ubuntu16.10.1_all.deb
	wget --directory-prefix=config/packages.chroot/ http://ppa.launchpad.net/snwh/pulp/ubuntu/pool/main/p/paper-gtk-theme/paper-gtk-theme_2.1+r262~daily~ubuntu16.04.1.dsc
	wget --directory-prefix=config/packages.chroot/ http://ppa.launchpad.net/snwh/pulp/ubuntu/pool/main/p/paper-gtk-theme/paper-gtk-theme_2.1+r262~daily~ubuntu16.04.1.tar.gz
	wget --directory-prefix=config/packages.chroot/ http://ppa.launchpad.net/snwh/pulp/ubuntu/pool/main/p/paper-gtk-theme/paper-gtk-theme_2.1+r262~daily~ubuntu16.04.1_all.deb
	wget --directory-prefix=config/packages.chroot/ http://ppa.launchpad.net/snwh/pulp/ubuntu/pool/main/p/paper-icon-theme/paper-cursor-theme_1.3+r561~daily~ubuntu16.04.1_all.deb
	wget --directory-prefix=config/packages.chroot/ http://ppa.launchpad.net/snwh/pulp/ubuntu/pool/main/p/paper-icon-theme/paper-icon-theme_1.3+r561~daily~ubuntu16.04.1.dsc
	wget --directory-prefix=config/packages.chroot/ http://ppa.launchpad.net/snwh/pulp/ubuntu/pool/main/p/paper-icon-theme/paper-icon-theme_1.3+r561~daily~ubuntu16.04.1.tar.xz
	wget --directory-prefix=config/packages.chroot/ http://ppa.launchpad.net/snwh/pulp/ubuntu/pool/main/p/paper-icon-theme/paper-icon-theme_1.3+r561~daily~ubuntu16.04.1_all.deb
	wget --directory-prefix=config/packages.chroot/ http://download.opensuse.org/repositories/home:/Horst3180/Debian_8.0/all/arc-theme_1465131682.3095952_all.deb
	#wget --directory-prefix=config/packages.chroot/ http://download.opensuse.org/repositories/home:/Horst3180/Debian_8.0/all/arc-theme-solid_1465131682.3095952_all.deb
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
	-rm -rf config/includes.chroot/etc/skel/.nano config/includes.chroot/etc/skel/.conky config/includes.chroot/etc/iceweasel/pref config/includes.chroot/usr/share/fonts/
	-mkdir -pv config/includes.chroot/etc/skel/ config/includes.chroot/etc/iceweasel/
	git clone https://github.com/serialhex/nano-highlight config/includes.chroot/etc/skel/.nano
	git clone --recursive https://github.com/nodiscc/conkyselect config/includes.chroot/etc/skel/.conky
	git clone -b dbu https://github.com/nodiscc/user.js config/includes.chroot/etc/iceweasel/pref
	git clone https://github.com/nodiscc/fonts config/includes.chroot/usr/share/fonts/
	
	git clone https://github.com/az0/cleanerml/ tmp-cleanerml
	-rm -rf config/includes.chroot/usr/share/bleachbit/
	mkdir -p config/includes.chroot/usr/share/bleachbit/
	mv tmp-cleanerml/release config/includes.chroot/usr/share/bleachbit/cleaners
	rm -rf tmp-cleanerml

lbbuild:
	sudo lb clean --all
	#sudo lb clean --purge #only necessary when changing the mirrors/architecture config
	sudo lb config
	sudo lb build

#TODO add GPG keys for verification, eg wget --directory-prefix=build/config/packages.chroot/ -O- https://jgeboski.github.io/obs.key | sudo apt-key add -
#TODO https://greasyfork.org/en/scripts/1190-flickr-original-link
#TODO https://greasyfork.org/en/scripts/494-youtube-auto-buffer-auto-hd
#TODO https://openuserjs.org/scripts/elundmark/Torrentz_All-in-One
#TODO install conky config GUI to target system (test hooks/make-install-conkyselect.hook.chroot)