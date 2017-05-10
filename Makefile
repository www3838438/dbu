#!/usr/bin/make -f

#############
## config - firefox/thunderbird addons location

# Firefox ESR default addons for new profiles
addonsdir=config/includes.chroot/usr/share/firefox-esr/distribution/extensions/
# Firefox (release/nightly) default addons for new profiles
#addonsdir=config/includes.chroot/usr/share/firefox/distribution/extensions/

#thunderbird/icedove addons path
tbaddonsdir="config/includes.chroot/etc/icedove/extensions/"

#############

all: buildenv clean update xpi documentation lbbuild checksums_sign

update: ffaddons tbaddons packageschroot purpleplugins themes dotfiles

buildenv:
	aptitude install live-build make build-essential wget git xmlstarlet unzip

clean:
	-rm $(tbaddonsdir)/*
	-rm $(addonsdir)/*
	-rm config/packages.chroot/*
	-rm -r config/includes.chroot/usr/lib/purple-2/*.so
	
#update firefox addons
ffaddons:
	# Security / privacy addons
	#https://addons.mozilla.org/en-US/firefox/addon/https-everywhere/
	wget -N -nv --show-progress -P $(addonsdir) https://addons.mozilla.org/firefox/downloads/latest/229918/addon-229918-latest.xpi
	#https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/
	wget -N -nv --show-progress -P $(addonsdir) https://addons.mozilla.org/firefox/downloads/latest/607454/addon-607454-latest.xpi
	#https://addons.mozilla.org/en-US/firefox/addon/canvasblocker/
	wget -N -nv --show-progress -P $(addonsdir) https://addons.mozilla.org/firefox/downloads/file/399286/canvasblocker-0.3.0-Release-fx.xpi
	#https://addons.mozilla.org/en-US/firefox/addon/self-destructing-cookies/
	wget -N -nv --show-progress -P $(addonsdir) https://addons.mozilla.org/firefox/downloads/latest/415846/addon-415846-latest.xpi
	#https://addons.mozilla.org/en-US/firefox/addon/decentraleyes/
	wget -N -nv --show-progress -P $(addonsdir) https://addons.mozilla.org/firefox/downloads/latest/521554/addon-521554-latest.xpi
	#https://addons.mozilla.org/en-US/firefox/addon/no-resource-uri-leak/
	wget -N -nv --show-progress -P $(addonsdir) https://addons.mozilla.org/firefox/downloads/latest/no-resource-uri-leak/addon-706000-latest.xpi
	#
	# UI-related / utility addons
	#https://addons.mozilla.org/en-US/firefox/addon/add-to-search-bar/
	wget -N -nv --show-progress -P $(addonsdir) https://addons.mozilla.org/firefox/downloads/latest/3682/addon-3682-latest.xpi
	#https://addons.mozilla.org/en-us/firefox/addon/yet-another-context-search/
	wget -N -nv --show-progress -P $(addonsdir) https://addons.mozilla.org/firefox/downloads/latest/392483/addon-392483-latest.xpi
	#https://addons.mozilla.org/en-US/firefox/addon/rss-icon-in-url-bar/
	wget -N -nv --show-progress -P $(addonsdir) https://addons.mozilla.org/firefox/downloads/file/339198/rss_icon_in_url_bar-1.5.2-sm+fx.xpi
	#
	# more addons (disabled):
	# https://addons.mozilla.org/en-US/firefox/addon/greasemonkey/
	#wget -N --directory-prefix=$(addonsdir) https://addons.mozilla.org/firefox/downloads/latest/greasemonkey/addon-748-latest.xpi
	# https://addons.mozilla.org/en-US/firefox/addon/scrapbook-x/
	#wget -N --directory-prefix=$(addonsdir) https://addons.mozilla.org/firefox/downloads/latest/scrapbook-x/addon-521726-latest.xpi
	# https://addons.mozilla.org/en-US/firefox/addon/scrapbook-copypageinfo/
	#wget -N --directory-prefix=$(addonsdir) https://addons.mozilla.org/firefox/downloads/latest/scrapbook-copypageinfo/addon-536398-latest.xpi
	# https://addons.mozilla.org/en-US/firefox/addon/scrapbookx-autosave/
	#wget -N --directory-prefix=$(addonsdir) https://addons.mozilla.org/firefox/downloads/latest/scrapbookx-autosave/addon-536396-latest.xpi
	# https://addons.mozilla.org/en-US/firefox/addon/scrapbookx-maf-creator/
	#wget -N --directory-prefix=$(addonsdir) https://addons.mozilla.org/firefox/downloads/latest/scrapbookx-maf-creator/addon-536394-latest.xpi
	# https://addons.mozilla.org/en-US/firefox/addon/scrapbookx-converter/
	#wget -N --directory-prefix=$(addonsdir) https://addons.mozilla.org/firefox/downloads/latest/scrapbookx-converter/addon-536392-latest.xpi
	# https://addons.mozilla.org/en-US/firefox/addon/downthemall/
	#wget -N --directory-prefix=$(addonsdir) https://addons.mozilla.org/firefox/downloads/latest/downthemall/addon-201-latest.xpi
	#
	# more addons (disabled):
	# https://addons.mozilla.org/en-US/firefox/addon/new-tab-bookmarks/
	# https://addons.mozilla.org/en-US/firefox/addon/password-exporter/
	# https://addons.mozilla.org/en-US/firefox/addon/watch-with-mpv/
	# https://addons.mozilla.org/en-US/firefox/addon/about-addons-memory/
	# https://addons.mozilla.org/en-us/firefox/addon/auto-refresh-for-twitter/
	# https://addons.mozilla.org/en-US/firefox/addon/bookmark-autohider/
	# https://addons.mozilla.org/en-US/firefox/addon/bookmark-deduplicator/
	# https://addons.mozilla.org/en-US/firefox/addon/bookrect/
	# https://addons.mozilla.org/en-US/firefox/addon/certificate-patrol/
	# https://addons.mozilla.org/en-US/firefox/addon/floatnotes/
	# https://addons.mozilla.org/en-US/firefox/addon/gnotifier/
	# https://addons.mozilla.org/en-us/firefox/addon/http-nowhere/
	# https://addons.mozilla.org/en-US/firefox/addon/lightbeam/
	# https://addons.mozilla.org/en-US/firefox/addon/link-visitor-3/
	# https://addons.mozilla.org/en-US/firefox/addon/markdown-viewer/
	# https://addons.mozilla.org/en-US/firefox/addon/mind-the-time/
	# https://addons.mozilla.org/en-US/firefox/addon/mozilla-archive-format/
	# https://addons.mozilla.org/en-US/firefox/addon/multifox/
	# https://addons.mozilla.org/en-US/firefox/addon/new-tab-tools/
	# https://addons.mozilla.org/en-US/firefox/addon/noscript/
	# https://addons.mozilla.org/en-US/firefox/addon/password-reuse-visualizer/
	# https://addons.mozilla.org/en-US/firefox/addon/perspectives/
	# https://addons.mozilla.org/en-US/firefox/addon/print-edit/
	# https://addons.mozilla.org/en-US/firefox/addon/random-agent-spoofer/
	# https://addons.mozilla.org/en-US/firefox/addon/reddit-enhancement-suite/
	# https://addons.mozilla.org/en-US/firefox/addon/requestpolicy-continued/
	# https://addons.mozilla.org/en-US/firefox/addon/simple-mail/
	# https://addons.mozilla.org/en-us/firefox/addon/ssleuth/
	# https://addons.mozilla.org/en-US/firefox/addon/tab-badge/
	# https://addons.mozilla.org/en-US/firefox/addon/tab-scope/
	# https://addons.mozilla.org/en-US/firefox/addon/tamper-data/
	# https://addons.mozilla.org/en-US/firefox/addon/terms-of-service-didnt-read/
	# https://addons.mozilla.org/en-US/firefox/addon/toggle-js/
	# https://addons.mozilla.org/en-US/firefox/addon/tree-style-tab/
	# https://addons.mozilla.org/en-US/firefox/addon/turn-off-the-lights/
	# https://addons.mozilla.org/en-US/firefox/addon/umatrix/
	# https://addons.mozilla.org/en-us/firefox/addon/unloadtab/
	# https://addons.mozilla.org/en-US/firefox/addon/update-scanner/
	# https://addons.mozilla.org/en-US/firefox/addon/user-agent-switcher/
	# https://addons.mozilla.org/en-US/firefox/addon/yesscript/
	# https://addons.mozilla.org/en-us/firefox/addon/copy-as-markdown/
	# https://addons.mozilla.org/en-US/firefox/addon/open-livestreamer/

#rename xpis from their id
xpi:
	mv $(addonsdir)/addon-3682-latest.xpi $(addonsdir)/add-to-searchbox@maltekraus.de #workaround, script doesn't work on this addon
	@for xpi in $$(find $(addonsdir) -name '*.xpi'); do \
	extid=$$(./scripts/get-xul-extension-id.sh "$$xpi"); echo "$$xpi - $$extid"; \
	mv "$$xpi" $(addonsdir)/"$$extid".xpi ; \
	done
	mv $(addonsdir)/add-to-searchbox@maltekraus.de $(addonsdir)/add-to-searchbox@maltekraus.de.xpi #workaround, 2nd part

#update thunderbird addons TODO
tbaddons:
	#https://addons.mozilla.org/en-US/thunderbird/addon/gmail-conversation-view/
	wget -N -nv --show-progress -P $(tbaddonsdir) https://addons.mozilla.org/thunderbird/downloads/latest/54035/addon-54035-latest.xpi
	#https://addons.mozilla.org/fr/thunderbird/addon/importexporttools/
	wget -N -nv --show-progress -P $(tbaddonsdir) https://addons.mozilla.org/thunderbird/downloads/file/348080/addon-348080-latest.xpi
	#https://addons.mozilla.org/en-US/thunderbird/addon/lightning/
	wget -N -nv --show-progress -P $(tbaddonsdir) https://addons.mozilla.org/thunderbird/downloads/latest/2313/platform:2/addon-2313-latest.xpi
	#https://addons.mozilla.org/en-US/thunderbird/addon/quote-colors/
	wget -N -nv --show-progress -P $(tbaddonsdir) https://addons.mozilla.org/thunderbird/downloads/latest/170/addon-170-latest.xpi
	#https://addons.mozilla.org/en-US/thunderbird/addon/enigmail/
	wget -N -nv --show-progress -P $(tbaddonsdir) https://addons.mozilla.org/thunderbird/downloads/latest/71/addon-71-latest.xpi
	#http://sogo.nu/download.html#/frontends
	wget -N -nv --show-progress -P $(tbaddonsdir) http://www.sogo.nu/files/downloads/SOGo/Thunderbird/sogo-connector-31.0.3.xpi
	#https://addons.mozilla.org/fr/thunderbird/addon/categorymanager/
	wget -N -nv --show-progress -P $(tbaddonsdir) https://addons.mozilla.org/thunderbird/downloads/latest/472193/addon-472193-latest.xpi
	#https://addons.mozilla.org/en-US/thunderbird/addon/duplicate-contact-manager/
	wget -N -nv --show-progress -P $(tbaddonsdir)  https://addons.mozilla.org/thunderbird/downloads/latest/2505/addon-2505-latest.xpi
	#https://addons.mozilla.org/en-US/thunderbird/addon/contact-tabs/
	wget -N -nv --show-progress -P $(tbaddonsdir) https://addons.mozilla.org/thunderbird/downloads/latest/306600/addon-306600-latest.xpi
	#https://addons.mozilla.org/en-US/thunderbird/addon/send-later-3/
	wget -N -nv --show-progress -P $(tbaddonsdir) https://addons.mozilla.org/thunderbird/downloads/file/423919/addon-423919-latest.xpi
	#https://addons.mozilla.org/fr/thunderbird/addon/todotxt-extension/
	wget -N -nv --show-progress -P $(tbaddonsdir) https://addons.mozilla.org/thunderbird/downloads/latest/650068/platform:2/addon-650068-latest.xpi
	#
	# more addons:
	# https://addons.mozilla.org/en-US/thunderbird/addon/printingtools/
	# https://addons.mozilla.org/fr/firefox/addon/minimizetotray-revived/
	# https://addons.mozilla.org/fr/thunderbird/addon/gmailui/
	# https://addons.mozilla.org/fr/thunderbird/addon/contact-photos/
	# https://addons.mozilla.org/en-us/thunderbird/addon/webdav-for-filelink/


# download non-debian chroot packages
# needs to be updated manually when upstream versions change
# see https://github.com/nodiscc/scriptz for more software
packageschroot:
	-mkdir -pv config/packages.chroot
	
	# https://launchpad.net/light-locker-settings
	wget -N -nv --show-progress -P config/packages.chroot/ http://cz.archive.ubuntu.com/ubuntu/pool/universe/l/light-locker-settings/light-locker-settings_1.5.0-0ubuntu1.debian.tar.xz
	wget -N -nv --show-progress -P config/packages.chroot/ http://cz.archive.ubuntu.com/ubuntu/pool/universe/l/light-locker-settings/light-locker-settings_1.5.0-0ubuntu1.dsc
	wget -N -nv --show-progress -P config/packages.chroot/ http://cz.archive.ubuntu.com/ubuntu/pool/universe/l/light-locker-settings/light-locker-settings_1.5.0-0ubuntu1_all.deb
	wget -N -nv --show-progress -P config/packages.chroot/ http://cz.archive.ubuntu.com/ubuntu/pool/universe/l/light-locker-settings/light-locker-settings_1.5.0.orig.tar.bz2
	
	# https://github.com/dequis/purple-facebook/wiki
	wget -N -nv --show-progress -P config/packages.chroot/ http://download.opensuse.org/repositories/home:/jgeboski/Debian_8.0/i386/purple-facebook_20170330~3cbb433~c9b74a765767~126_i386.deb
	wget -N -nv --show-progress -P config/packages.chroot/ http://download.opensuse.org/repositories/home:/jgeboski/Debian_8.0/amd64/purple-facebook_20170330~3cbb433~c9b74a765767~126_amd64.deb
	wget -N -nv --show-progress -P config/packages.chroot/ http://download.opensuse.org/repositories/home:/jgeboski/Debian_8.0/purple-facebook_20170330~3cbb433~c9b74a765767~126.tar.gz
	wget -N -nv --show-progress -P config/packages.chroot/ http://download.opensuse.org/repositories/home:/jgeboski/Debian_8.0/purple-facebook_20170330~3cbb433~c9b74a765767~126.dsc
	
	# https://github.com/MrS0m30n3/youtube-dl-gui/releases
	wget -N -nv --show-progress -P config/packages.chroot/ http://ppa.launchpad.net/nilarimogard/webupd8/ubuntu/pool/main/y/youtube-dlg/youtube-dlg_0.3.8-1~webupd8~xenial3.debian.tar.xz
	wget -N -nv --show-progress -P config/packages.chroot/ http://ppa.launchpad.net/nilarimogard/webupd8/ubuntu/pool/main/y/youtube-dlg/youtube-dlg_0.3.8-1~webupd8~xenial3.dsc
	wget -N -nv --show-progress -P config/packages.chroot/ http://ppa.launchpad.net/nilarimogard/webupd8/ubuntu/pool/main/y/youtube-dlg/youtube-dlg_0.3.8-1~webupd8~xenial3_all.deb
	wget -N -nv --show-progress -P config/packages.chroot/ http://ppa.launchpad.net/nilarimogard/webupd8/ubuntu/pool/main/y/youtube-dlg/youtube-dlg_0.3.8.orig.tar.gz
	
	# https://github.com/feross/webtorrent-desktop/
	#ignore errors because host prevents getting content-length and cause subsequent downloads to fail.
	-wget -N -nv --show-progress -P config/packages.chroot/ https://github.com/feross/webtorrent-desktop/releases/download/v0.18.0/webtorrent-desktop_0.18.0-1_amd64.deb
	-wget -N -nv --show-progress -P config/packages.chroot/ https://github.com/feross/webtorrent-desktop/releases/download/v0.18.0/webtorrent-desktop_0.18.0-1_i386.deb

	### THEMES ###
	# https://numixproject.org/
	wget -N -nv --show-progress -P config/packages.chroot/ http://ppa.launchpad.net/numix/ppa/ubuntu/pool/main/n/numix-icon-theme-bevel/numix-icon-theme-bevel_1.0+201410212340~8~ubuntu14.10.1.dsc
	wget -N -nv --show-progress -P config/packages.chroot/ http://ppa.launchpad.net/numix/ppa/ubuntu/pool/main/n/numix-icon-theme-bevel/numix-icon-theme-bevel_1.0+201410212340~8~ubuntu14.10.1.tar.xz
	wget -N -nv --show-progress -P config/packages.chroot/ http://ppa.launchpad.net/numix/ppa/ubuntu/pool/main/n/numix-icon-theme-bevel/numix-icon-theme-bevel_1.0+201410212340~8~ubuntu14.10.1_all.deb
	wget -N -nv --show-progress -P config/packages.chroot/ http://ppa.launchpad.net/numix/ppa/ubuntu/pool/main/n/numix-icon-theme-circle/numix-icon-theme-circle_2.0.3+14~201704051632~ubuntu17.04.1.dsc
	wget -N -nv --show-progress -P config/packages.chroot/ http://ppa.launchpad.net/numix/ppa/ubuntu/pool/main/n/numix-icon-theme-circle/numix-icon-theme-circle_2.0.3+14~201704051632~ubuntu17.04.1.tar.xz
	wget -N -nv --show-progress -P config/packages.chroot/ http://ppa.launchpad.net/numix/ppa/ubuntu/pool/main/n/numix-icon-theme-circle/numix-icon-theme-circle_2.0.3+14~201704051632~ubuntu17.04.1_all.deb
	wget -N -nv --show-progress -P config/packages.chroot/ http://ppa.launchpad.net/numix/ppa/ubuntu/pool/main/n/numix-icon-theme/numix-icon-theme_0.3+895~201704281833~ubuntu17.04.1.dsc
	wget -N -nv --show-progress -P config/packages.chroot/ http://ppa.launchpad.net/numix/ppa/ubuntu/pool/main/n/numix-icon-theme/numix-icon-theme_0.3+895~201704281833~ubuntu17.04.1.tar.xz
	wget -N -nv --show-progress -P config/packages.chroot/ http://ppa.launchpad.net/numix/ppa/ubuntu/pool/main/n/numix-icon-theme/numix-icon-theme_0.3+895~201704281833~ubuntu17.04.1_all.deb	
	
	# https://github.com/snwh/paper-gtk-theme
	wget -N -nv --show-progress -P config/packages.chroot/ http://ppa.launchpad.net/snwh/pulp/ubuntu/pool/main/p/paper-gtk-theme/paper-gtk-theme_2.1+r265~daily~ubuntu16.04.1.dsc
	wget -N -nv --show-progress -P config/packages.chroot/ http://ppa.launchpad.net/snwh/pulp/ubuntu/pool/main/p/paper-gtk-theme/paper-gtk-theme_2.1+r265~daily~ubuntu16.04.1.tar.gz
	wget -N -nv --show-progress -P config/packages.chroot/ http://ppa.launchpad.net/snwh/pulp/ubuntu/pool/main/p/paper-gtk-theme/paper-gtk-theme_2.1+r265~daily~ubuntu16.04.1_all.deb
	
	# https://github.com/snwh/paper-cursor-theme
	# https://github.com/snwh/paper-icon-theme
	wget -N -nv --show-progress -P config/packages.chroot/ http://ppa.launchpad.net/snwh/pulp/ubuntu/pool/main/p/paper-icon-theme/paper-cursor-theme_1.3+r672~daily~ubuntu15.10.1_all.deb
	wget -N -nv --show-progress -P config/packages.chroot/ http://ppa.launchpad.net/snwh/pulp/ubuntu/pool/main/p/paper-icon-theme/paper-icon-theme_1.3+r672~daily~ubuntu15.10.1.dsc
	wget -N -nv --show-progress -P config/packages.chroot/ http://ppa.launchpad.net/snwh/pulp/ubuntu/pool/main/p/paper-icon-theme/paper-icon-theme_1.3+r672~daily~ubuntu15.10.1.tar.xz
	wget -N -nv --show-progress -P config/packages.chroot/ http://ppa.launchpad.net/snwh/pulp/ubuntu/pool/main/p/paper-icon-theme/paper-icon-theme_1.3+r672~daily~ubuntu15.10.1_all.deb
	
	# https://github.com/horst3180/Ceti-2-theme
	wget -N -nv --show-progress -P config/packages.chroot/ http://download.opensuse.org/repositories/home:/Horst3180/Debian_8.0/all/ceti-2-theme_1442961272.9fe3d9f_all.deb
	
	# https://github.com/horst3180/Vertex-theme
	wget -N -nv --show-progress -P config/packages.chroot/ http://download.opensuse.org/repositories/home:/Horst3180/Debian_8.0/all/vertex-theme_1459280359.d828032_all.deb

# download pidgin plugins
purpleplugins:
	mkdir -pv config/includes.chroot/usr/lib/purple-2/
	wget -N -nv --show-progress -P config/includes.chroot/usr/lib/purple-2/ \
		https://github.com/EionRobb/pidgin-opensteamworks/releases/download/1.6.1/libsteam64-1.6.1.so \
		https://github.com/EionRobb/pidgin-opensteamworks/releases/download/1.6.1/libsteam-1.6.1.so

# download gtk/wm themes
themes:
	-rm -rf config/includes.chroot/usr/share/themes/
	mkdir -pv config/includes.chroot/usr/share/themes/
	git clone --depth=1 https://github.com/shimmerproject/Albatross config/includes.chroot/usr/share/themes/Albatross
	git clone --depth=1 https://github.com/shimmerproject/Blackbird config/includes.chroot/usr/share/themes/Blackbird
	git clone --depth=1 https://github.com/shimmerproject/Bluebird config/includes.chroot/usr/share/themes/Bluebird
	git clone --depth=1 https://github.com/shimmerproject/Greybird config/includes.chroot/usr/share/themes/Greybird
	git clone --depth=1 https://github.com/shimmerproject/Numix config/includes.chroot/usr/share/themes/Numix
	git clone --depth=1 https://github.com/shimmerproject/Orion config/includes.chroot/usr/share/themes/Orion
	git clone --depth=1 https://github.com/satya164/Evolve config/includes.chroot/usr/share/themes/Evolve
	git clone --depth=1 https://github.com/xyl0n/iris config/includes.chroot/usr/share/themes/iris
	git clone --depth=1 https://github.com/xyl0n/iris-light config/includes.chroot/usr/share/themes/iris-light
	git clone --depth=1 https://github.com/BunsenLabs/deb8-theme config/includes.chroot/usr/share/themes/deb8

	git clone --depth=1 https://github.com/lassekongo83/zuki-themes tmp-zuki-themes
	mv tmp-zuki-themes/Zukitre tmp-zuki-themes/Zukitwo config/includes.chroot/usr/share/themes/
	rm -rf tmp-zuki-themes

# download misc configuration files
dotfiles:
	-rm -rf config/includes.chroot/etc/skel/.nano config/includes.chroot/etc/skel/.conky config/includes.chroot/usr/share/fonts/ config/includes.chroot/usr/share/ohmpage
	-mkdir -pv config/includes.chroot/etc/skel/
	git clone --depth=1 https://github.com/serialhex/nano-highlight config/includes.chroot/etc/skel/.nano
	git clone --depth=1 --recursive https://github.com/nodiscc/conkyselect config/includes.chroot/etc/skel/.conky 
	git clone --depth=1 https://github.com/nodiscc/fonts config/includes.chroot/usr/share/fonts/
	git clone --depth=1 https://github.com/nodiscc/ohmpage config/includes.chroot/usr/share/ohmpage
	
	git clone --depth=1 https://github.com/az0/cleanerml/ tmp-cleanerml
	-rm -rf config/includes.chroot/usr/share/bleachbit/
	mkdir -p config/includes.chroot/usr/share/bleachbit/
	mv tmp-cleanerml/release config/includes.chroot/usr/share/bleachbit/cleaners
	rm -rf tmp-cleanerml

	git clone -b dbu --depth=1 https://github.com/nodiscc/user.js tmp-userjs
	-rm -rf config/includes.chroot/etc/firefox-esr/
	mkdir -p config/includes.chroot/etc/firefox-esr/
	mv tmp-userjs/firefox.js config/includes.chroot/etc/firefox-esr/firefox-esr.js
	rm -rf tmp-userjs

	# Example: include files in the root directory of the live ISO
	# mkdir -pv config/includes.binary/extra/
	# git clone --recursive https://github.com/nodiscc/scriptz config/includes.binary/extra/scriptz
	# cp /path/to/intro.html config/includes.binary/intro.html

documentation:
	-rm -r doc/packages/*.md
	./scripts/doc-generator.sh
	-rm doc/packages/00-*

lbbuild:
	sudo lb clean --all
	#sudo lb clean --purge #only necessary when changing the mirrors/architecture config
	sudo lb config
	sudo lb build

checksum_sign:
	last_tag=$$(git tag | tail -n1); \
	cd iso/; \
	rename "s/live-image/dbu-$$last_tag-debian-stretch/" *; \
	sha512sum *.iso  > SHA512SUMS; \
	gpg --clearsign SHA512SUMS; \
	mv SHA512SUMS.asc SHA512SUMS.sign
