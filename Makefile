#!/usr/bin/make -f

all: buildenv clean update ffxpi tbxpi documentation lbbuild

update: ffaddons tbaddons packageschroot binaries themes dotfiles

buildenv:
	sudo aptitude install live-build make build-essential wget git xmlstarlet unzip colordiff

clean:
	git clean -df

documentation:
	-rm -r doc/packages/*.md
	./scripts/doc-generator.sh

lbbuild:
	sudo lb clean --all
	#sudo lb clean --purge #only required when changing the mirrors/architecture config
	sudo lb config
	sudo lb build

checksum_sign:
	last_tag=$$(git tag | tail -n1); \
	cd iso/; \
	rename "s/live-image/dbu-$$last_tag-debian-stretch/" *; \
	sha512sum *.iso  > SHA512SUMS; \
	gpg --detach-sign --armor SHA512SUMS; \
	mv SHA512SUMS.asc SHA512SUMS.sign

# compare the resulting image's package list against upstream debian/xfce live image
pkglist_url="https://cdimage.debian.org/debian-cd/current-live/amd64/iso-hybrid/debian-live-9.2.0-amd64-xfce.packages"
compare_upstream_packagelist:
	wget -N $(pkglist_url) -O "iso/debian-live-amd64-xfce.packages"
	last_tag=$$(git tag | tail -n1); \
	colordiff "iso/debian-live-amd64-xfce.packages" "iso/dbu-$$last_tag-debian-stretch-amd64.hybrid.packages"

################################################################################
#update firefox addons
#firefox addons path (esr)
ffaddonsdir=config/includes.chroot/usr/share/firefox-esr/distribution/extensions/
#firefox addons path (release/nightly)
#addonsdir=config/includes.chroot/usr/share/firefox/distribution/extensions/
ffaddons:
	if [ ! -d $(ffaddonsdir) ]; then mkdir -p $(ffaddonsdir); fi
	# Security / privacy addons
	#https://addons.mozilla.org/en-US/firefox/addon/https-everywhere/ [e10s]
	wget -N -nv --show-progress -P $(ffaddonsdir) https://addons.mozilla.org/firefox/downloads/latest/229918/addon-229918-latest.xpi
	#https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/ [e10s]
	wget -N -nv --show-progress -P $(ffaddonsdir) https://addons.mozilla.org/firefox/downloads/latest/607454/addon-607454-latest.xpi
	#https://addons.mozilla.org/en-US/firefox/addon/canvasblocker/ [e10s]
	wget -N -nv --show-progress -P $(ffaddonsdir) https://addons.mozilla.org/firefox/downloads/file/399286/canvasblocker-0.3.0-Release-fx.xpi
	#https://addons.mozilla.org/en-US/firefox/addon/decentraleyes/ [e10s]
	wget -N -nv --show-progress -P $(ffaddonsdir) https://addons.mozilla.org/firefox/downloads/latest/521554/addon-521554-latest.xpi
	#https://addons.mozilla.org/en-US/firefox/addon/no-resource-uri-leak/
	wget -N -nv --show-progress -P $(ffaddonsdir) https://addons.mozilla.org/firefox/downloads/latest/no-resource-uri-leak/addon-706000-latest.xpi
	#https://addons.mozilla.org/en-US/firefox/addon/cookie-autodelete/
	wget -N -nv --show-progress -P $(ffaddonsdir) https://addons.mozilla.org/firefox/downloads/latest/cookie-autodelete/platform:5/addon-784287-latest.xpi
	#https://addons.mozilla.org/en-US/firefox/addon/dark-mode-webextension/ [webextension]
	wget -N -nv --show-progress -P $(ffaddonsdir) https://addons.mozilla.org/firefox/downloads/latest/dark-mode-webextension/addon-786990-latest.xpi
	#https://addons.mozilla.org/en-US/firefox/addon/rsstube/ [webextension]
	wget -N -nv --show-progress -P $(ffaddonsdir) https://addons.mozilla.org/firefox/downloads/latest/rsstube/addon-819680-latest.xpi
	#https://addons.mozilla.org/en-US/firefox/addon/simple-youtube-repeater/ [webextension]
	wget -N -nv --show-progress -P $(ffaddonsdir) https://addons.mozilla.org/firefox/downloads/latest/simple-youtube-repeater/platform:2/addon-622208-latest.xpi
	#
	# more addons (disabled):
	# https://addons.mozilla.org/en-US/firefox/addon/smart-referer/ [e10s]
	# https://addons.mozilla.org/en-US/firefox/addon/note-taker/ [webextension]
	# https://addons.mozilla.org/en-US/firefox/addon/surligneur/ [webextension]
	# https://addons.mozilla.org/en-US/firefox/addon/self-destructing-cookies/ [legacy]
	# https://addons.mozilla.org/en-US/firefox/addon/downthemall/ [e10s]
	# https://addons.mozilla.org/en-US/firefox/addon/bulk-media-downloader/ [webextension]
	# https://addons.mozilla.org/en-US/firefox/addon/scrapbook-x/ [legacy]
	# https://addons.mozilla.org/en-US/firefox/addon/scrapbookx-autosave/ [legacy]
	# https://addons.mozilla.org/en-US/firefox/addon/scrapbookx-maf-creator/ [legacy]
	# https://addons.mozilla.org/en-US/firefox/addon/scrapbookx-converter/ [legacy]
	# https://addons.mozilla.org/en-US/firefox/addon/scrapbook-copypageinfo/ [legacy]
	# https://addons.mozilla.org/en-US/firefox/addon/rss-icon-in-url-bar/ [legacy]
	# https://addons.mozilla.org/en-US/firefox/addon/greasemonkey/ [e10s]
	# https://addons.mozilla.org/en-US/firefox/addon/tampermonkey/ [webextension]
	# https://addons.mozilla.org/en-us/firefox/addon/yet-another-context-search/ [legacy]
	# https://addons.mozilla.org/en-US/firefox/addon/add-to-search-bar/ [legacy]
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
ffxpi:
	@for xpi in $$(find $(ffaddonsdir) -name '*.xpi'); do \
	extid=$$(./scripts/get-xul-extension-id.sh "$$xpi"); echo "$$xpi - $$extid"; \
	mv "$$xpi" $(ffaddonsdir)/"$$extid".xpi ; \
	done

#update thunderbird addons
#thunderbird addons path
tbaddonsdir="config/includes.chroot/usr/share/thunderbird/extensions/"
tbaddons:
	if [ ! -d $(tbaddonsdir) ]; then mkdir -p $(tbaddonsdir); fi
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
	# https://addons.mozilla.org/fr/thunderbird/addon/cardbook/
	wget -N -nv --show-progress -P $(tbaddonsdir) https://addons.mozilla.org/thunderbird/downloads/latest/cardbook/addon-634298-latest.xpi
	#https://addons.mozilla.org/en-US/thunderbird/addon/duplicate-contact-manager/
	wget -N -nv --show-progress -P $(tbaddonsdir) https://addons.mozilla.org/thunderbird/downloads/latest/2505/addon-2505-latest.xpi
	#https://addons.mozilla.org/en-US/thunderbird/addon/send-later-3/
	wget -N -nv --show-progress -P $(tbaddonsdir) https://addons.mozilla.org/thunderbird/downloads/file/423919/addon-423919-latest.xpi
	#https://addons.mozilla.org/fr/thunderbird/addon/account-colors/
	wget -N -nv --show-progress -P $(tbaddonsdir) https://addons.mozilla.org/thunderbird/downloads/latest/account-colors/addon-14385-latest.xpi

	#
	# more addons:
	# https://addons.mozilla.org/en-US/thunderbird/addon/printingtools/
	# https://addons.mozilla.org/fr/firefox/addon/minimizetotray-revived/
	# https://addons.mozilla.org/fr/thunderbird/addon/gmailui/
	# https://addons.mozilla.org/en-US/thunderbird/addon/timeline/
	# https://addons.mozilla.org/en-US/thunderbird/addon/more-snooze/
	# https://addons.mozilla.org/en-US/thunderbird/addon/automatic-export/
	# https://addons.mozilla.org/fr/thunderbird/addon/contact-photos/
	# https://addons.mozilla.org/en-us/thunderbird/addon/webdav-for-filelink/
	# https://addons.mozilla.org/fr/thunderbird/addon/quickfolders-tabbed-folders/
	# https://addons.mozilla.org/fr/thunderbird/addon/todotxt-extension/
	#wget -N -nv --show-progress -P $(tbaddonsdir) https://addons.mozilla.org/thunderbird/downloads/latest/650068/platform:2/addon-650068-latest.xpi
	# https://addons.mozilla.org/fr/thunderbird/addon/categorymanager/
	#wget -N -nv --show-progress -P $(tbaddonsdir) https://addons.mozilla.org/thunderbird/downloads/latest/472193/addon-472193-latest.xpi
	# http://sogo.nu/download.html#/frontends
	#wget -N -nv --show-progress -P $(tbaddonsdir) http://www.sogo.nu/files/downloads/SOGo/Thunderbird/sogo-connector-31.0.3.xpi
	# https://addons.mozilla.org/en-US/thunderbird/addon/contact-tabs/
	#wget -N -nv --show-progress -P $(tbaddonsdir) https://addons.mozilla.org/thunderbird/downloads/latest/306600/addon-306600-latest.xpi

tbxpi:
	@for xpi in $$(find $(tbaddonsdir) -name '*.xpi'); do \
	extid=$$(./scripts/get-xul-extension-id.sh "$$xpi"); echo "$$xpi - $$extid"; \
	mv "$$xpi" $(tbaddonsdir)/"$$extid".xpi ; \
	done

################################################################################
# download non-debian chroot packages
# needs to be updated manually when upstream versions change
# ideally everything should be packaged in the Debian archive
# see https://github.com/nodiscc/scriptz for more software
WGETPACKAGES := wget -N -nv --show-progress -P config/packages.chroot/
packageschroot:
	-mkdir -pv config/packages.chroot
	
	# https://launchpad.net/light-locker-settings
	# ubuntu-archive-keyring.gpg
	$(WGETPACKAGES) http://archive.ubuntu.com/ubuntu/pool/universe/l/light-locker-settings/light-locker-settings_1.5.0-0ubuntu1.debian.tar.xz
	$(WGETPACKAGES) http://archive.ubuntu.com/ubuntu/pool/universe/l/light-locker-settings/light-locker-settings_1.5.0-0ubuntu1.dsc
	$(WGETPACKAGES) http://archive.ubuntu.com/ubuntu/pool/universe/l/light-locker-settings/light-locker-settings_1.5.0-0ubuntu1_all.deb
	$(WGETPACKAGES) http://archive.ubuntu.com/ubuntu/pool/universe/l/light-locker-settings/light-locker-settings_1.5.0.orig.tar.bz2
	
	# https://github.com/dequis/purple-facebook/wiki
	$(WGETPACKAGES) http://download.opensuse.org/repositories/home:/jgeboski/Debian_9.0/amd64/purple-facebook_20171004~4aa77de~9ff9acf9fa14~137_amd64.deb
	$(WGETPACKAGES) http://download.opensuse.org/repositories/home:/jgeboski/Debian_9.0/purple-facebook_20171004~4aa77de~9ff9acf9fa14~137.tar.gz
	$(WGETPACKAGES) http://download.opensuse.org/repositories/home:/jgeboski/Debian_9.0/purple-facebook_20171004~4aa77de~9ff9acf9fa14~137.dsc
	
	# https://github.com/MrS0m30n3/youtube-dl-gui/releases
	$(WGETPACKAGES) http://ppa.launchpad.net/nilarimogard/webupd8/ubuntu/pool/main/y/youtube-dlg/youtube-dlg_0.4-1~webupd8~zesty4.debian.tar.xz
	$(WGETPACKAGES) http://ppa.launchpad.net/nilarimogard/webupd8/ubuntu/pool/main/y/youtube-dlg/youtube-dlg_0.4-1~webupd8~zesty4.dsc
	$(WGETPACKAGES) http://ppa.launchpad.net/nilarimogard/webupd8/ubuntu/pool/main/y/youtube-dlg/youtube-dlg_0.4-1~webupd8~zesty4_all.deb
	$(WGETPACKAGES) http://ppa.launchpad.net/nilarimogard/webupd8/ubuntu/pool/main/y/youtube-dlg/youtube-dlg_0.4.orig.tar.gz
	$(WGETPACKAGES) http://ppa.launchpad.net/nilarimogard/webupd8/ubuntu/pool/main/p/python-twodict/python-twodict_1.2-1~webupd8~zesty0_all.deb
	$(WGETPACKAGES) http://ppa.launchpad.net/nilarimogard/webupd8/ubuntu/pool/main/p/python-twodict/python-twodict_1.2-1~webupd8~zesty0.dsc
	$(WGETPACKAGES) http://ppa.launchpad.net/nilarimogard/webupd8/ubuntu/pool/main/p/python-twodict/python-twodict_1.2-1~webupd8~zesty0.debian.tar.xz
	$(WGETPACKAGES) http://ppa.launchpad.net/nilarimogard/webupd8/ubuntu/pool/main/p/python-twodict/python-twodict_1.2.orig.tar.gz

	
	# https://github.com/feross/webtorrent-desktop/
	-$(WGETPACKAGES) https://github.com/feross/webtorrent-desktop/releases/download/v0.18.0/webtorrent-desktop_0.18.0-1_amd64.deb

	### GTK/WM THEMES (from git) ###
	# https://numixproject.org
	#$(WGETPACKAGES) http://ppa.launchpad.net/numix/ppa/ubuntu/pool/main/n/numix-icon-theme-bevel/numix-icon-theme-bevel_1.0+201410212340~8~ubuntu14.10.1.dsc
	#$(WGETPACKAGES) http://ppa.launchpad.net/numix/ppa/ubuntu/pool/main/n/numix-icon-theme-bevel/numix-icon-theme-bevel_1.0+201410212340~8~ubuntu14.10.1.tar.xz
	#$(WGETPACKAGES) http://ppa.launchpad.net/numix/ppa/ubuntu/pool/main/n/numix-icon-theme-bevel/numix-icon-theme-bevel_1.0+201410212340~8~ubuntu14.10.1_all.deb
	$(WGETPACKAGES) http://ppa.launchpad.net/numix/ppa/ubuntu/pool/main/n/numix-icon-theme-circle/numix-icon-theme-circle_2.0.3+17~201709261931~ubuntu14.04.1.dsc
	$(WGETPACKAGES) http://ppa.launchpad.net/numix/ppa/ubuntu/pool/main/n/numix-icon-theme-circle/numix-icon-theme-circle_2.0.3+17~201709261931~ubuntu14.04.1.tar.gz
	$(WGETPACKAGES) http://ppa.launchpad.net/numix/ppa/ubuntu/pool/main/n/numix-icon-theme-circle/numix-icon-theme-circle_2.0.3+17~201709261931~ubuntu14.04.1_all.deb
	$(WGETPACKAGES) http://ppa.launchpad.net/numix/ppa/ubuntu/pool/main/n/numix-icon-theme/numix-icon-theme_0.3+905~201709261927~ubuntu14.04.1.dsc
	$(WGETPACKAGES) http://ppa.launchpad.net/numix/ppa/ubuntu/pool/main/n/numix-icon-theme/numix-icon-theme_0.3+905~201709261927~ubuntu14.04.1.tar.gz
	$(WGETPACKAGES) http://ppa.launchpad.net/numix/ppa/ubuntu/pool/main/n/numix-icon-theme/numix-icon-theme_0.3+905~201709261927~ubuntu14.04.1_all.deb	
		
	# https://github.com/snwh/paper-gtk-theme
	# http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=862403
	# https://github.com/nodiscc/paper-icon-theme/tree/debian-packaging
	$(WGETPACKAGES) http://ppa.launchpad.net/snwh/pulp/ubuntu/pool/main/p/paper-gtk-theme/paper-gtk-theme_2.1+r265~daily~ubuntu16.04.1.dsc
	$(WGETPACKAGES) http://ppa.launchpad.net/snwh/pulp/ubuntu/pool/main/p/paper-gtk-theme/paper-gtk-theme_2.1+r265~daily~ubuntu16.04.1.tar.gz
	$(WGETPACKAGES) http://ppa.launchpad.net/snwh/pulp/ubuntu/pool/main/p/paper-gtk-theme/paper-gtk-theme_2.1+r265~daily~ubuntu16.04.1_all.deb
	
	# https://github.com/snwh/paper-icon-theme
	# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=802505
	$(WGETPACKAGES) http://ppa.launchpad.net/snwh/pulp/ubuntu/pool/main/p/paper-icon-theme/paper-icon-theme_1.3+r672~daily~ubuntu15.10.1.dsc
	$(WGETPACKAGES) http://ppa.launchpad.net/snwh/pulp/ubuntu/pool/main/p/paper-icon-theme/paper-icon-theme_1.3+r672~daily~ubuntu15.10.1.tar.xz
	$(WGETPACKAGES) http://ppa.launchpad.net/snwh/pulp/ubuntu/pool/main/p/paper-icon-theme/paper-icon-theme_1.3+r672~daily~ubuntu15.10.1_all.deb

	# https://github.com/snwh/paper-cursor-theme (disabled)
	#$(WGETPACKAGES) http://ppa.launchpad.net/snwh/pulp/ubuntu/pool/main/p/paper-icon-theme/paper-cursor-theme_1.3+r672~daily~ubuntu15.10.1_all.deb

	# https://qwinff.github.io/
	# https://github.com/qwinff/qwinff
	# https://github.com/qwinff/qwinff/issues/18
	$(WGETPACKAGES) http://ppa.launchpad.net/lzh9102/qwinff/ubuntu/pool/main/q/qwinff/qwinff_0.2.0-1~wily2.debian.tar.gz
	$(WGETPACKAGES) http://ppa.launchpad.net/lzh9102/qwinff/ubuntu/pool/main/q/qwinff/qwinff_0.2.0-1~wily2.dsc
	$(WGETPACKAGES) http://ppa.launchpad.net/lzh9102/qwinff/ubuntu/pool/main/q/qwinff/qwinff_0.2.0-1~wily2_amd64.deb
	
	# https://github.com/horst3180/Ceti-2-theme
	# http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=862402
	#$(WGETPACKAGES) http://download.opensuse.org/repositories/home:/Horst3180/Debian_8.0/all/ceti-2-theme_1442961272.9fe3d9f_all.deb
	
	# https://github.com/horst3180/Vertex-theme
	#$(WGETPACKAGES) http://download.opensuse.org/repositories/home:/Horst3180/Debian_8.0/all/vertex-theme_1459280359.d828032_all.deb

################################################################################
# Download prebuilt binaries for non-packaged software
binaries:
	# https://github.com/EionRobb/pidgin-opensteamworks/
	mkdir -pv config/includes.chroot/usr/lib/purple-2/
	wget -N -nv --show-progress -P config/includes.chroot/usr/lib/purple-2/ \
		https://github.com/EionRobb/pidgin-opensteamworks/releases/download/1.6.1/libsteam64-1.6.1.so \
		https://github.com/EionRobb/pidgin-opensteamworks/releases/download/1.6.1/libsteam-1.6.1.so

################################################################################
# download gtk/wm themes
themes:
	-rm -rf config/includes.chroot/usr/share/themes/
	mkdir -pv config/includes.chroot/usr/share/themes/
	git clone --depth=1 https://github.com/shimmerproject/Albatross config/includes.chroot/usr/share/themes/Albatross
	git clone --depth=1 https://github.com/shimmerproject/Blackbird config/includes.chroot/usr/share/themes/Blackbird
	git clone --depth=1 https://github.com/shimmerproject/Bluebird config/includes.chroot/usr/share/themes/Bluebird
	git clone --depth=1 https://github.com/shimmerproject/Greybird config/includes.chroot/usr/share/themes/Greybird
	git clone --depth=1 https://github.com/shimmerproject/Numix config/includes.chroot/usr/share/themes/Numix
	#git clone --depth=1 https://github.com/shimmerproject/Orion config/includes.chroot/usr/share/themes/Orion
	#git clone --depth=1 https://github.com/satya164/Evolve config/includes.chroot/usr/share/themes/Evolve
	#git clone --depth=1 https://github.com/xyl0n/iris config/includes.chroot/usr/share/themes/iris
	#git clone --depth=1 https://github.com/xyl0n/iris-light config/includes.chroot/usr/share/themes/iris-light
	#git clone --depth=1 https://github.com/BunsenLabs/deb8-theme config/includes.chroot/usr/share/themes/deb8

	git clone --depth=1 https://github.com/lassekongo83/zuki-themes tmp-zuki-themes
	mv tmp-zuki-themes/Zukitre tmp-zuki-themes/Zukitwo config/includes.chroot/usr/share/themes/
	rm -rf tmp-zuki-themes

################################################################################
# download misc configuration files
dotfiles:
	-rm -rf config/includes.chroot/etc/skel/.nano \
	config/includes.chroot/usr/share/ohmpage \
	config/includes.chroot/usr/share/bleachbit/cleaners \
	config/includes.chroot/etc/firefox-esr/firefox-esr.js
	
	# https://github.com/serialhex/nano-highlight
	git clone --depth=1 https://github.com/serialhex/nano-highlight config/includes.chroot/etc/skel/.nano
	
	# https://github.com/nodiscc/conkyselect (disabled)
	#git clone --depth=1 --recursive https://github.com/nodiscc/conkyselect config/includes.chroot/etc/skel/.conky 

	# https://github.com/nodiscc/fonts
	#git clone --depth=1 https://github.com/nodiscc/fonts config/includes.chroot/usr/share/fonts/

	# https://github.com/nodiscc/ohmpage
	git clone --depth=1 https://github.com/nodiscc/ohmpage config/includes.chroot/usr/share/ohmpage
	
	# https://github.com/az0/cleanerml/
	git clone --depth=1 https://github.com/az0/cleanerml/ tmp-cleanerml
	-rm -rf config/includes.chroot/usr/share/bleachbit/
	mkdir -p config/includes.chroot/usr/share/bleachbit/
	mv tmp-cleanerml/release config/includes.chroot/usr/share/bleachbit/cleaners
	rm -rf tmp-cleanerml

	# https://github.com/nodiscc/user.js
	git clone -b dbu --depth=1 https://github.com/nodiscc/user.js tmp-userjs
	-rm -rf config/includes.chroot/etc/firefox-esr/
	mkdir -p config/includes.chroot/etc/firefox-esr/
	mv tmp-userjs/firefox.js config/includes.chroot/etc/firefox-esr/firefox-esr.js
	rm -rf tmp-userjs

	# Example: add extra files to the live file system
	# git clone --recursive https://github.com/nodiscc/scriptz config/includes.chroot/usr/share/dbu/scriptz
	# git clone https://github.com/nodiscc/dbu config/includes.chroot/usr/share/dbu/dbu-source

	# Example: include files in the root directory of the live ISO
	# mkdir -pv config/includes.binary/extra/

	# cp /path/to/intro.html config/includes.binary/intro.html

################################################################################

