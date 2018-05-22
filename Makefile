#!/usr/bin/make -f

all: install_buildenv tests update_deps rename_xpi build

update_deps: download_firefox_addons download_binaries download_dotfiles

rename_xpi: rename_firefox_xpi

release: documentation tests checksums sign torrent

######

install_buildenv:
	sudo apt install live-build make build-essential wget git xmlstarlet unzip colordiff \
		shellcheck apt-transport-https

tests:
	#Check scripts syntax
	@shellcheck --exclude=SC2016,SC2086,SC1001 scripts/*.sh
	#Packages without descriptions in documentation:
	@cd doc/packages/ && egrep "^ \* .* $$" *.md || continue
	#Empty links in documentation:
	@cd doc/packages/ && grep -r '()' && echo "WARNING invalid markdown links found"

documentation:
	-mkdir doc/packages/
	-rm -r doc/packages/*.md
	./scripts/doc-generator.sh

build:
	sudo lb clean --all
	#sudo lb clean --purge #only required when changing the mirrors/architecture config
	sudo lb config
	sudo lb build
	-mkdir iso/
	mv *.iso iso/

#########################################

checksums:
	last_tag=$$(git tag | tail -n1); \
	cd iso/; \
	rename "s/live-image/dbu-$$last_tag-debian-stretch/" *; \
	sha512sum *.iso  > SHA512SUMS; \

sign:
	cd iso; \
	gpg --detach-sign --armor SHA512SUMS; \
	mv SHA512SUMS.asc SHA512SUMS.sign

test_kvm:
	# virt-manager must be installed, a VM using the correct ISO file must be configured
	virt-manager --connect qemu:///system --show-domain-console dbu-test

#########################################

# Download Firefox addons
download_dir=cache/firefox_addons/
download_firefox_addons:
	if [ ! -d $(download_dir) ]; then mkdir -p $(download_dir); fi
	#https://addons.mozilla.org/en-US/firefox/addon/https-everywhere/ [e10s] [security]
	wget -N -nv --show-progress -P $(download_dir) https://addons.mozilla.org/firefox/downloads/latest/229918/addon-229918-latest.xpi
	#https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/ [e10s] [security]
	wget -N -nv --show-progress -P $(download_dir) https://addons.mozilla.org/firefox/downloads/latest/607454/addon-607454-latest.xpi
	#https://addons.mozilla.org/en-US/firefox/addon/canvasblocker/ [e10s] [security]
	wget -N -nv --show-progress -P $(download_dir) https://addons.mozilla.org/firefox/downloads/file/399286/canvasblocker-0.3.0-Release-fx.xpi
	#https://addons.mozilla.org/en-US/firefox/addon/decentraleyes/ [e10s] [security] [FF52ESR]
	wget -N -nv --show-progress -P $(download_dir) https://addons.mozilla.org/firefox/downloads/file/710414/decentraleyes-1.3.10-an+fx+sm.xpi
	#https://addons.mozilla.org/en-US/firefox/addon/no-resource-uri-leak/ [security]
	wget -N -nv --show-progress -P $(download_dir) https://addons.mozilla.org/firefox/downloads/latest/no-resource-uri-leak/addon-706000-latest.xpi
	#https://addons.mozilla.org/en-US/firefox/addon/cookie-autodelete/ [security] [FF52ESR]
	wget -N -nv --show-progress -P $(download_dir) https://addons.mozilla.org/firefox/downloads/file/717459/cookie_autodelete-1.4.4-an+fx.xpi
	#
	# Other addons:
	# https://addons.mozilla.org/en-US/firefox/addon/dark-mode-webextension/ [webextension] [ui]
	# https://addons.mozilla.org/en-US/firefox/addon/simple-youtube-repeater/ [webextension] [ui]
	# https://addons.mozilla.org/en-US/firefox/addon/smart-referer/ [e10s] [security]
	# https://addons.mozilla.org/en-US/firefox/addon/link-cleaner/ [webextension] [security]
	# https://addons.mozilla.org/en-US/firefox/addon/note-taker/ [webextension] [tools]
	# https://addons.mozilla.org/en-US/firefox/addon/surligneur/ [webextension] [tools]
	# https://addons.mozilla.org/en-US/firefox/addon/self-destructing-cookies/ [legacy] [security]
	# https://addons.mozilla.org/en-US/firefox/addon/downthemall/ [e10s] [tools]
	# https://addons.mozilla.org/en-US/firefox/addon/bulk-media-downloader/ [webextension] [tools]
	# https://addons.mozilla.org/en-US/firefox/addon/scrapbook-x/ [legacy] [tools]
	# https://addons.mozilla.org/en-US/firefox/addon/scrapbookx-autosave/ [legacy] [tools]
	# https://addons.mozilla.org/en-US/firefox/addon/scrapbookx-maf-creator/ [legacy] [tools]
	# https://addons.mozilla.org/en-US/firefox/addon/scrapbookx-converter/ [legacy] [tools]
	# https://addons.mozilla.org/en-US/firefox/addon/scrapbook-copypageinfo/ [legacy] [tools]
	# https://addons.mozilla.org/fr/firefox/addon/shaarli/ - https://addons.mozilla.org/firefox/downloads/file/815126/addon-815126-latest.xpi [webextension] [tools]
	# https://addons.mozilla.org/en-US/firefox/addon/rss-icon-in-url-bar/ [legacy] [ui]
	# https://addons.mozilla.org/en-US/firefox/addon/greasemonkey/ [e10s] [tools]
	# https://addons.mozilla.org/en-US/firefox/addon/tampermonkey/ [webextension] [tools]
	# https://addons.mozilla.org/en-us/firefox/addon/yet-another-context-search/ [legacy] [ui]
	# https://addons.mozilla.org/en-US/firefox/addon/add-to-search-bar/ [legacy] [ui]
	# https://addons.mozilla.org/en-US/firefox/addon/new-tab-bookmarks/ [ui]
	# https://addons.mozilla.org/en-US/firefox/addon/password-exporter/ [tools]
	# https://addons.mozilla.org/en-US/firefox/addon/watch-with-mpv/ [tools]
	# https://addons.mozilla.org/en-US/firefox/addon/about-addons-memory/ [dev]
	# https://addons.mozilla.org/en-us/firefox/addon/auto-refresh-for-twitter/ [tools]
	# https://addons.mozilla.org/en-US/firefox/addon/bookmark-autohider/ [ui]
	# https://addons.mozilla.org/en-US/firefox/addon/bookmark-deduplicator/ [tools]
	# https://addons.mozilla.org/en-US/firefox/addon/bookrect/ [tools]
	# https://addons.mozilla.org/en-US/firefox/addon/certificate-patrol/ [security]
	# https://addons.mozilla.org/en-US/firefox/addon/floatnotes/ [tools]
	# https://addons.mozilla.org/en-US/firefox/addon/gnotifier/ [tools]
	# https://addons.mozilla.org/en-us/firefox/addon/http-nowhere/ [security]
	# https://addons.mozilla.org/en-US/firefox/addon/lightbeam/ [security]
	# https://addons.mozilla.org/en-US/firefox/addon/link-visitor-3/ [tools]
	# https://addons.mozilla.org/en-US/firefox/addon/markdown-viewer/ [tools]
	# https://addons.mozilla.org/en-US/firefox/addon/mind-the-time/ [tools]
	# https://addons.mozilla.org/en-US/firefox/addon/mozilla-archive-format/ [tools]
	# https://addons.mozilla.org/en-US/firefox/addon/multifox/ [tools]
	# https://addons.mozilla.org/en-US/firefox/addon/new-tab-tools/ [ui]
	# https://addons.mozilla.org/en-US/firefox/addon/noscript/ [security]
	# https://addons.mozilla.org/en-US/firefox/addon/password-reuse-visualizer/ [security]
	# https://addons.mozilla.org/en-US/firefox/addon/perspectives/ [security]
	# https://addons.mozilla.org/en-US/firefox/addon/print-edit/ [tools]
	# https://addons.mozilla.org/en-US/firefox/addon/random-agent-spoofer/ [security]
	# https://addons.mozilla.org/en-US/firefox/addon/reddit-enhancement-suite/ [tools]
	# https://addons.mozilla.org/en-US/firefox/addon/requestpolicy-continued/ [security]
	# https://addons.mozilla.org/en-US/firefox/addon/simple-mail/ [tools]
	# https://addons.mozilla.org/en-us/firefox/addon/ssleuth/ [security]
	# https://addons.mozilla.org/en-US/firefox/addon/tab-badge/ [ui]
	# https://addons.mozilla.org/en-US/firefox/addon/tab-scope/ [ui]
	# https://addons.mozilla.org/en-US/firefox/addon/tamper-data/ [dev]
	# https://addons.mozilla.org/en-US/firefox/addon/terms-of-service-didnt-read/ [security]
	# https://addons.mozilla.org/en-US/firefox/addon/toggle-js/ [ui]
	# https://addons.mozilla.org/en-US/firefox/addon/tree-style-tab/ [ui]
	# https://addons.mozilla.org/en-US/firefox/addon/turn-off-the-lights/ [ui]
	# https://addons.mozilla.org/en-US/firefox/addon/umatrix/[security]
	# https://addons.mozilla.org/en-us/firefox/addon/unloadtab/ [dev]
	# https://addons.mozilla.org/en-US/firefox/addon/update-scanner/ [tools]
	# https://addons.mozilla.org/en-US/firefox/addon/user-agent-switcher/ [dev]
	# https://addons.mozilla.org/en-US/firefox/addon/yesscript/ [security]
	# https://addons.mozilla.org/en-us/firefox/addon/copy-as-markdown/ [tools]
	# https://addons.mozilla.org/en-US/firefox/addon/open-livestreamer/ [tools]
	# https://addons.mozilla.org/en-US/firefox/addon/privacy-settings-webextension/ [legacy] [security]
	# https://addons.mozilla.org/en-US/firefox/addon/policy-control/ [legacy] [security]
	# https://addons.mozilla.org/en-US/firefox/addon/rsstube/ [webextension] (broken) [ui]

# Download prebuilt binaries for unpackaged software
download_binaries:
	# https://github.com/EionRobb/pidgin-opensteamworks/
	if [ ! -d config/includes.chroot/usr/lib/purple-2/ ]; then mkdir -p config/includes.chroot/usr/lib/purple-2/; fi
	wget -N -nv --show-progress -P config/includes.chroot/usr/lib/purple-2/ \
		https://github.com/EionRobb/pidgin-opensteamworks/releases/download/1.6.1/libsteam64-1.6.1.so \
		https://github.com/EionRobb/pidgin-opensteamworks/releases/download/1.6.1/libsteam-1.6.1.so

##################################################################
# Rename downloaded XPIs from their ID
# Addons path (Firefox ESR)
firefox_addons_dir=config/includes.chroot/usr/share/firefox-esr/distribution/extensions/
# Addons path (release/nightly)
#firefox_addons_dir=config/includes.chroot/usr/share/firefox/distribution/extensions/
rename_firefox_xpi:
	-rm $(firefox_addons_dir)/*.xpi
	if [ ! -d $(firefox_addons_dir) ]; then mkdir -p $(firefox_addons_dir); fi
	@for xpi in $$(find $(download_dir) -name '*.xpi'); do \
	extid=$$(./scripts/get-xul-extension-id.sh "$$xpi"); \
	echo "$$xpi - $$extid"; \
	cp "$$xpi" $(firefox_addons_dir)/"$$extid".xpi ; \
	done

##################################################################

# Download dotfiles/themes/...
download_dotfiles:
	# https://github.com/serialhex/nano-highlight
	-rm -rf config/includes.chroot/etc/skel/.nano
		git clone --depth=1 https://github.com/serialhex/nano-highlight config/includes.chroot/etc/skel/.nano
		rm -rf config/includes.chroot/etc/skel/.nano/.git
	
	# https://github.com/nodiscc/fonts
	-rm -rf config/includes.chroot/usr/share/fonts
		git clone --depth=1 https://github.com/nodiscc/fonts config/includes.chroot/usr/share/fonts/
		rm -rf config/includes.chroot/usr/share/fonts/.git

	# https://github.com/nodiscc/ohmpage (disabled)
	#git clone --depth=1 https://github.com/nodiscc/ohmpage config/includes.chroot/usr/share/ohmpage
		#rm -rf config/includes.chroot/usr/share/ohmpage/.git

	# https://github.com/az0/cleanerml/
	-rm -rf config/includes.chroot/usr/share/bleachbit/cleaners
		git clone --depth=1 https://github.com/az0/cleanerml/ tmp-cleanerml
		mkdir -p config/includes.chroot/usr/share/bleachbit/
		mv tmp-cleanerml/release config/includes.chroot/usr/share/bleachbit/cleaners
		rm -rf tmp-cleanerml

	# https://github.com/nodiscc/user.js
	-rm -rf config/includes.chroot/etc/firefox-esr/firefox-esr.js
		git clone -b dbu --depth=1 https://github.com/nodiscc/user.js tmp-userjs
		mkdir -p config/includes.chroot/etc/firefox-esr/
		cd tmp-userjs && make systemwide_user.js
		cp tmp-userjs/systemwide_user.js config/includes.chroot/etc/firefox-esr/firefox-esr.js
		rm -rf tmp-userjs

    # icon themes
	-mkdir -pv config/includes.chroot/usr/share/icons/	
	# https://github.com/snwh/paper-icon-theme
	-rm -rf config/includes.chroot/usr/share/icons/Paper*
		git clone --depth=1 https://github.com/snwh/paper-icon-theme tmp-paper-icon-theme
		mv tmp-paper-icon-theme/Paper tmp-paper-icon-theme/Paper-Mono-Dark config/includes.chroot/usr/share/icons/
		rm -rf tmp-paper-icon-theme

	# Example: add extra files to the live file system
	# git clone --recursive https://github.com/nodiscc/toolbox config/includes.chroot/usr/share/dbu/toolbox
	# git clone https://github.com/nodiscc/dbu config/includes.chroot/usr/share/dbu/src

	# Example: include files in the root directory of the live ISO
	# mkdir -pv config/includes.binary/extra/
	# cp /path/to/intro.html config/includes.binary/intro.html

	# For examples of how to download/include custom packages, dotfiles, themes, libraries,
	# check git branches extras/gtk-themes, extras/pidgin-opensteamworks, extras/webtorrent...

