#!/bin/bash
# Description: generate markdown package documentation from live-build config/packages.chroot directory
# License: WTFPL
# Source: https://github.com/nodiscc/dbu
#TODO: generate index of markdown files
#TODO screenshots: fetch multiple screenshots
set -o errexit

export LANG="C"
export package_categories="Utility Office Multimedia Graphics Network System Games Science"
	pageheader="# Installed software

	See [Usage](usage.md#Installing-removing-updating-software) for documentation on installing,
	removing or updating software packages.
	"

###############################################################################

function _genPackagesDoc {
	# gather information from a package list ($1), format it to markdown
	packagelist=$1

	packages=$(egrep "^[a0-z9]" $packagelist || echo "" ) # packages in list
	mainpackage=$(echo "$packages " |head -n1 || echo "") # main package from the list
	alt_packages=$(egrep "^#Alt:" $packagelist | cut -d" " -f1 --complement) # alternative/suggested packages
	md_title="# $(egrep "^#Name" $packagelist | cut -d" " -f1 --complement)" # page title
	md_resources=
	md_category=

	if egrep "^#NoDescription" "$packagelist" >/dev/null; then
		# remove all descriptions if the package list has a #NoDescription field
		md_description=""
		md_shortdescription=""
		md_homepage=""
	elif egrep "^#ChrootPkg" $packagelist >/dev/null; then
		# get information from .deb file if the list has a #ChrootPkg field
		descriptionpackage=$(egrep "^#ChrootPkg" $packagelist | cut -d" " -f1 --complement)
		debfile=$(find config/packages.chroot/ -iname "${descriptionpackage}_*amd64*.deb" -o -iname "${descriptionpackage}_*all*.deb")
		dpkginfo=$(dpkg -I $debfile)
		md_description=$(echo "$dpkginfo" | egrep "^  [A-z]")
		md_shortdescription=""
		md_homepage="**[Homepage]($(echo "$dpkginfo" | egrep "^ Homepage" | awk -F": " '{print $2}'))**"
		packages="$descriptionpackage"
	else
		# use #Desc field to specify the package to descript, or use the main package
		if egrep "^#Desc:" $packagelist >/dev/null; then
			descriptionpackage=$(egrep "^#Desc" $packagelist | cut -d" " -f1 --complement)
		else descriptionpackage=$mainpackage
		fi
		# generate markdown page title, desciptions, homepage links
		md_description="$(apt-cache show $descriptionpackage | egrep "^ " | egrep -v "::" | sed -e 's/^ \.$/ /g' | cut -b1 --complement)"
		md_shortdescription="_$(apt-cache show $descriptionpackage | egrep "Description(-en|-fr)" | cut -d" " -f1 --complement | head -n1)_"
		md_homepage="**[Homepage]($(apt-cache show $descriptionpackage | egrep "^Homepage:" | cut -d" " -f1 --complement))**"
	fi
	# TODO: move this to the loop above
	if egrep "^#Screenshot:" $packagelist >/dev/null; then
		screenshotpackage=$(egrep "^#Screenshot:" $packagelist | cut -d" " -f1 --complement)
		else screenshotpackage=$mainpackage
	fi

	md_screenshot="[![](https://screenshots.debian.net/thumbnail/$screenshotpackage/)](https://screenshots.debian.net/screenshot/$screenshotpackage/)"
	_renderMarkdown
}


function _renderMarkdown {
	# 
	echo -e "$md_title"
	if [ ! -z "$md_shortdescription" ]; then echo -e "\n_${md_shortdescription}_\n"; fi
	if [ ! -z "$md_description" ]; then
		echo -e '```'
		echo -e "\n$md_description\n"
		echo '```'
	fi
	echo -e "\n$md_screenshot\n"
	echo -e "\n $md_homepage"
	echo -e "\n### Installed packages\n"
	for i in $packages; do
		echo "* [$i](https://packages.debian.org/stretch/$i) - $(apt-cache show $i | egrep "Description(-en|-fr)" | cut -d" " -f1 --complement | head -n1)"
	done

	echo -e "\n### Related packages\n"
	echo -n '<sub> '
	for i in $alt_packages; do
		echo -n "[$i](https://packages.debian.org/stretch/$i) "
	done
	echo ' </sub>'
}

function _main {
	# check mandatory #Cat: category field
	for i in config/package-lists/[a-z]*.list.chroot; do
		if ! egrep "#Cat:" "$i" >/dev/null; then
			echo "WARNING: No category defined for $i - list will not be included in the index page."
		fi
	done

	# generate markdown package pages for all package lists
	for i in config/package-lists/[a-z]*.list.chroot; do
		echo "$i"
		_genPackagesDoc $i > doc/packages/$(basename $i).md
	done
}


function _gen_package_index {
	#generate an index of all markdown package lists
	pkgindex=$(
		for category in $package_categories; do
			echo -e "\n### $category";
			for plist in config/package-lists/[a-z]*.chroot; do
					if egrep "^#Cat: $category" $plist >/dev/null; then
						pname=$(egrep "^#Name:" $plist | cut -d" " -f1 --complement)
				 		echo " - [$pname](packages/$(basename $plist).md)"
					fi
			done
		done
		echo -e "\n### Non-debian packages";
		for deb in config/packages.chroot/*{all,amd64}.deb; do
			package=$(dpkg -I $deb | egrep "Package:" | awk -F' ' '{print $2}')
			homepage=$(dpkg -I $deb | egrep "Homepage:" | awk -F' ' '{print $2}')
			description=$(dpkg -I $deb | egrep "Description:" | awk '{$1=""; sub("  ", ""); print}')
			echo "* [$package]($homepage) - $description"
		done
	)
	echo "$pageheader
	$pkgindex" > doc/packages.md
}


_main
_gen_package_index

