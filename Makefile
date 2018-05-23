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

# Download cache directory
download_dir=cache/firefox_addons/
# Addons installation path (Firefox ESR)
firefox_addons_dir=config/includes.chroot/usr/share/firefox-esr/distribution/extensions/
# Addons installation path (release/nightly)
#firefox_addons_dir=config/includes.chroot/usr/share/firefox/distribution/extensions/

# Download Firefox addons
download_firefox_addons:
	if [ ! -d $(download_dir) ]; then mkdir -p $(download_dir); fi
	#https://addons.mozilla.org/en-US/firefox/addon/https-everywhere/ [e10s] [security] [installed]
	wget -N -nv --show-progress -P $(download_dir) https://addons.mozilla.org/firefox/downloads/latest/229918/addon-229918-latest.xpi
	#https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/ [e10s] [security] [installed]
	wget -N -nv --show-progress -P $(download_dir) https://addons.mozilla.org/firefox/downloads/latest/607454/addon-607454-latest.xpi
	#https://addons.mozilla.org/en-US/firefox/addon/canvasblocker/ [e10s] [security] [installed]
	wget -N -nv --show-progress -P $(download_dir) https://addons.mozilla.org/firefox/downloads/file/399286/canvasblocker-0.3.0-Release-fx.xpi
	#https://addons.mozilla.org/en-US/firefox/addon/decentraleyes/ [e10s] [security] [FF52ESR]
	wget -N -nv --show-progress -P $(download_dir) https://addons.mozilla.org/firefox/downloads/file/710414/decentraleyes-1.3.10-an+fx+sm.xpi
	#https://addons.mozilla.org/en-US/firefox/addon/no-resource-uri-leak/ [security] [installed]
	wget -N -nv --show-progress -P $(download_dir) https://addons.mozilla.org/firefox/downloads/latest/no-resource-uri-leak/addon-706000-latest.xpi
	#https://addons.mozilla.org/en-US/firefox/addon/cookie-autodelete/ [security] [FF52ESR] [installed]
	wget -N -nv --show-progress -P $(download_dir) https://addons.mozilla.org/firefox/downloads/file/717459/cookie_autodelete-1.4.4-an+fx.xpi


# Download prebuilt binaries for unpackaged software
download_binaries:
	# https://github.com/EionRobb/pidgin-opensteamworks/
	if [ ! -d config/includes.chroot/usr/lib/purple-2/ ]; then mkdir -p config/includes.chroot/usr/lib/purple-2/; fi
	wget -N -nv --show-progress -P config/includes.chroot/usr/lib/purple-2/ \
		https://github.com/EionRobb/pidgin-opensteamworks/releases/download/1.6.1/libsteam64-1.6.1.so \
		https://github.com/EionRobb/pidgin-opensteamworks/releases/download/1.6.1/libsteam-1.6.1.so

##################################################################
# Rename downloaded XPIs from their ID, install them to distribution directory
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

