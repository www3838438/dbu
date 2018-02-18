#!/usr/bin/make -f

all: install_buildenv tests update_deps rename_xpi build

update_deps: download_firefox_addons download_thunderbird_addons download_packageschroot download_binaries download_dotfiles

rename_xpi: rename_firefox_xpi rename_thunderbird_xpi

release: documentation tests checksums sign torrent

######

install_buildenv:
	sudo apt install live-build make build-essential wget git xmlstarlet unzip colordiff \
		shellcheck apt-transport-https

tests:
	#Check scripts syntax
	@shellcheck --exclude=SC2016,SC2086,SC1001 scripts/*.sh
	#Packages without descriptions:
	@cd doc/packages/ && egrep "^ \* .* $$" *.md || continue

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
	gpg --detach-sign --armor SHA512SUMS; \
	mv SHA512SUMS.asc SHA512SUMS.sign

#########################################

# Download Firefox addons
# Addons path (Firefox ESR)
download_firefox_addonsdir=config/includes.chroot/usr/share/firefox-esr/distribution/extensions/
# Addons path (release/nightly)
#addonsdir=config/includes.chroot/usr/share/firefox/distribution/extensions/
download_firefox_addons:
	if [ ! -d $(download_firefox_addonsdir) ]; then mkdir -p $(download_firefox_addonsdir); fi
	#https://addons.mozilla.org/en-US/firefox/addon/https-everywhere/ [e10s] [security]
	wget -N -nv --show-progress -P $(download_firefox_addonsdir) https://addons.mozilla.org/firefox/downloads/latest/229918/addon-229918-latest.xpi
	#https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/ [e10s] [security]
	wget -N -nv --show-progress -P $(download_firefox_addonsdir) https://addons.mozilla.org/firefox/downloads/latest/607454/addon-607454-latest.xpi
	#https://addons.mozilla.org/en-US/firefox/addon/canvasblocker/ [e10s] [security]
	wget -N -nv --show-progress -P $(download_firefox_addonsdir) https://addons.mozilla.org/firefox/downloads/file/399286/canvasblocker-0.3.0-Release-fx.xpi
	#https://addons.mozilla.org/en-US/firefox/addon/decentraleyes/ [e10s] [security] [FF52ESR]
	wget -N -nv --show-progress -P $(download_firefox_addonsdir) https://addons.mozilla.org/firefox/downloads/file/710414/decentraleyes-1.3.10-an+fx+sm.xpi
	#https://addons.mozilla.org/en-US/firefox/addon/no-resource-uri-leak/ [security]
	wget -N -nv --show-progress -P $(download_firefox_addonsdir) https://addons.mozilla.org/firefox/downloads/latest/no-resource-uri-leak/addon-706000-latest.xpi
	#https://addons.mozilla.org/en-US/firefox/addon/cookie-autodelete/ [security] [FF52ESR]
	wget -N -nv --show-progress -P $(download_firefox_addonsdir) https://addons.mozilla.org/firefox/downloads/file/717459/cookie_autodelete-1.4.4-an+fx.xpi
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

# Download Thunderbird addons
# Addons path
download_thunderbird_addonsdir="config/includes.chroot/usr/share/thunderbird/extensions/"
download_thunderbird_addons:
	if [ ! -d $(download_thunderbird_addonsdir) ]; then mkdir -p $(download_thunderbird_addonsdir); fi
	#https://addons.mozilla.org/en-US/thunderbird/addon/gmail-conversation-view/
	wget -N -nv --show-progress -P $(download_thunderbird_addonsdir) https://addons.mozilla.org/thunderbird/downloads/latest/54035/addon-54035-latest.xpi
	#https://addons.mozilla.org/fr/thunderbird/addon/importexporttools/
	wget -N -nv --show-progress -P $(download_thunderbird_addonsdir) https://addons.mozilla.org/thunderbird/downloads/file/348080/addon-348080-latest.xpi
	#https://addons.mozilla.org/en-US/thunderbird/addon/lightning/
	wget -N -nv --show-progress -P $(download_thunderbird_addonsdir) https://addons.mozilla.org/thunderbird/downloads/latest/2313/platform:2/addon-2313-latest.xpi
	#https://addons.mozilla.org/en-US/thunderbird/addon/enigmail/
	wget -N -nv --show-progress -P $(download_thunderbird_addonsdir) https://addons.mozilla.org/thunderbird/downloads/latest/71/addon-71-latest.xpi
	# https://addons.mozilla.org/fr/thunderbird/addon/cardbook/
	wget -N -nv --show-progress -P $(download_thunderbird_addonsdir) https://addons.mozilla.org/thunderbird/downloads/latest/cardbook/addon-634298-latest.xpi
	#https://addons.mozilla.org/en-US/thunderbird/addon/duplicate-contact-manager/
	wget -N -nv --show-progress -P $(download_thunderbird_addonsdir) https://addons.mozilla.org/thunderbird/downloads/latest/2505/addon-2505-latest.xpi
	#https://addons.mozilla.org/en-US/thunderbird/addon/send-later-3/
	wget -N -nv --show-progress -P $(download_thunderbird_addonsdir) https://addons.mozilla.org/thunderbird/downloads/file/423919/addon-423919-latest.xpi
	#https://addons.mozilla.org/fr/thunderbird/addon/account-colors/
	wget -N -nv --show-progress -P $(download_thunderbird_addonsdir) https://addons.mozilla.org/thunderbird/downloads/latest/account-colors/addon-14385-latest.xpi
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
	# https://addons.mozilla.org/fr/thunderbird/addon/categorymanager/
	# https://sogo.nu/download.html#/frontends
	# https://addons.mozilla.org/en-US/thunderbird/addon/contact-tabs/
	# https://addons.mozilla.org/en-US/thunderbird/addon/quote-colors/ (<52)

# Download extra .deb packages for inclusion in the resulting system
# Packages listed here will receive no automatic upgrades, unless someone packages
# them under the same name in the Debian archive. Packages listed here will NOT
# be verified by GPG signing mechanisms, so it is advised to rely on a secure
# transport (such as HTTPS + checksum verification) to ensure they are authentic.
# If adding packages from an APT repository, you could download the Release,
# Release signature, and Packages files, download the signing key by secure means,
# Then verifying the signature and checksums as described in 
# https://debian-handbook.info/browse/stable/sect.package-authentication.html
# Adding .deb packages downloaded via HTTP is NOT recommended.
WGETPACKAGES := wget -N -nv --show-progress -P config/packages.chroot/
download_packageschroot:
	-mkdir -pv config/packages.chroot
	# https://github.com/feross/webtorrent-desktop/
	-$(WGETPACKAGES) https://github.com/feross/webtorrent-desktop/releases/download/v0.18.0/webtorrent-desktop_0.18.0-1_amd64.deb

# Download prebuilt binaries for unpackaged software
download_binaries:
	# https://github.com/EionRobb/pidgin-opensteamworks/
	mkdir -pv config/includes.chroot/usr/lib/purple-2/
	wget -N -nv --show-progress -P config/includes.chroot/usr/lib/purple-2/ \
		https://github.com/EionRobb/pidgin-opensteamworks/releases/download/1.6.1/libsteam64-1.6.1.so \
		https://github.com/EionRobb/pidgin-opensteamworks/releases/download/1.6.1/libsteam-1.6.1.so

##################################################################
# Rename downloaded XPIs from their ID
rename_firefox_xpi:
	@for xpi in $$(find $(download_firefox_addonsdir) -name '*.xpi'); do \
	extid=$$(./scripts/get-xul-extension-id.sh "$$xpi"); \
	echo "$$xpi - $$extid"; \
	mv "$$xpi" $(download_firefox_addonsdir)/"$$extid".xpi ; \
	done

rename_thunderbird_xpi:
	@for xpi in $$(find $(download_thunderbird_addonsdir) -name '*.xpi'); do \
	extid=$$(./scripts/get-xul-extension-id.sh "$$xpi"); echo "$$xpi - $$extid"; \
	mv "$$xpi" $(download_thunderbird_addonsdir)/"$$extid".xpi ; \
	done

##################################################################

download_dotfiles: dotfiles_themes dotfiles_utility

# Download gtk/wm/icon themes
dotfiles_themes:
	-mkdir -pv config/includes.chroot/usr/share/themes/

	-rm -r config/includes.chroot/usr/share/themes/Albatross
		git clone --depth=1 https://github.com/shimmerproject/Albatross config/includes.chroot/usr/share/themes/Albatross
		rm -r config/includes.chroot/usr/share/themes/Albatross/.git
	-rm -r config/includes.chroot/usr/share/themes/Blackbird
		git clone --depth=1 https://github.com/shimmerproject/Blackbird config/includes.chroot/usr/share/themes/Blackbird
	-rm -r config/includes.chroot/usr/share/themes/Bluebird
		git clone --depth=1 https://github.com/shimmerproject/Bluebird config/includes.chroot/usr/share/themes/Bluebird
	-rm -r config/includes.chroot/usr/share/themes/Greybird
		git clone --depth=1 https://github.com/shimmerproject/Greybird config/includes.chroot/usr/share/themes/Greybird
	-rm -r config/includes.chroot/usr/share/themes/Numix
		git clone --depth=1 https://github.com/shimmerproject/Numix config/includes.chroot/usr/share/themes/Numix
	-rm -r config/includes.chroot/usr/share/themes/Zukitre
		-rm -r config/includes.chroot/usr/share/themes/Zukitwo
		git clone --depth=1 https://github.com/lassekongo83/zuki-themes tmp-zuki-themes
		mv tmp-zuki-themes/Zukitre tmp-zuki-themes/Zukitwo config/includes.chroot/usr/share/themes/
		rm -rf tmp-zuki-themes

	-mkdir -pv config/includes.chroot/usr/share/icons/	

	-rm -rf config/includes.chroot/usr/share/icons/Paper*
		# RFP http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=862403 https://github.com/snwh/paper-gtk-theme http://ppa.launchpad.net/snwh/pulp/ubuntu/pool/main/p/
		git clone --depth=1 https://github.com/snwh/paper-icon-theme tmp-paper-icon-theme
		mv tmp-paper-icon-theme/Paper tmp-paper-icon-theme/Paper-Mono-Dark config/includes.chroot/usr/share/icons/
		rm -rf tmp-paper-icon-theme

# Download misc configuration files
dotfiles_utility:
	# https://github.com/serialhex/nano-highlight
	-rm -rvf config/includes.chroot/etc/skel/.nano
	git clone --depth=1 https://github.com/serialhex/nano-highlight config/includes.chroot/etc/skel/.nano
	
	# https://github.com/nodiscc/fonts
	-rm -rvf config/includes.chroot/usr/share/fonts
	git clone --depth=1 https://github.com/nodiscc/fonts config/includes.chroot/usr/share/fonts/

	# https://github.com/nodiscc/ohmpage (disabled)
	#git clone --depth=1 https://github.com/nodiscc/ohmpage config/includes.chroot/usr/share/ohmpage
	
	# https://github.com/az0/cleanerml/
	git clone --depth=1 https://github.com/az0/cleanerml/ tmp-cleanerml
	-rm -rvf config/includes.chroot/usr/share/bleachbit/cleaners
	mkdir -p config/includes.chroot/usr/share/bleachbit/
	mv tmp-cleanerml/release config/includes.chroot/usr/share/bleachbit/cleaners
	rm -rf tmp-cleanerml

	# https://github.com/nodiscc/user.js
	git clone -b dbu --depth=1 https://github.com/nodiscc/user.js tmp-userjs
	-rm -rvf config/includes.chroot/etc/firefox-esr/firefox-esr.js
	mkdir -p config/includes.chroot/etc/firefox-esr/
	cd tmp-userjs && make systemwide_user.js
	cp tmp-userjs/systemwide_user.js config/includes.chroot/etc/firefox-esr/firefox-esr.js
	rm -rf tmp-userjs

	# Example: add extra files to the live file system
	# git clone --recursive https://github.com/nodiscc/toolbox config/includes.chroot/usr/share/dbu/toolbox
	# git clone https://github.com/nodiscc/dbu config/includes.chroot/usr/share/dbu/src

	# Example: include files in the root directory of the live ISO
	# mkdir -pv config/includes.binary/extra/
	# cp /path/to/intro.html config/includes.binary/intro.html


