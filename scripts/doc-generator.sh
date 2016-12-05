#!/bin/bash
#Desc: generate markdown package documentation from live-build config/packages.chroot directory
#License: WTFPL
#TODO: generate index of markdown files
#TODO screenshots: fetch multiple screenshots
export LANG="C"

function _genPackagesDoc {
packagelist=$1

packages=$(egrep "^[a0-z9]" $packagelist)
mainpackage=$(echo "$packages " |head -n1)
md_title="# $(egrep "^#Name" $packagelist | cut -d" " -f1 --complement)"
md_shortdescription="_$(_getShortDescription $mainpackage)_"
alts=$(egrep "^#Alt:" $packagelist | cut -d" " -f1 --complement)
md_resources=
md_category=
md_homepage="**[Homepage]($(apt-cache show $mainpackage | egrep "^Homepage:" | cut -d" " -f1 --complement))**"

if egrep "^#Desc:" $packagelist >/dev/null; then
    descriptionpackage=$(egrep "^#Desc" $packagelist | cut -d" " -f1 --complement)
    else descriptionpackage=$mainpackage
fi

md_description="$(apt-cache show $descriptionpackage | egrep "^ " | egrep -v "::" | sed -e 's/^ \.$/ /g' | cut -b1 --complement)"

if egrep "^#Screenshot:" $packagelist >/dev/null; then
    screenshotpackage=$(egrep "^#Screenshot:" $packagelist | cut -d" " -f1 --complement)
    else screenshotpackage=$mainpackage
fi

md_screenshot="![](https://screenshots.debian.net/thumbnail/$screenshotpackage/)"

_renderMarkdown

}

function _getShortDescription {
	apt-cache show $1 | egrep "Description(-en|-fr)" | cut -d" " -f1 --complement | head -n1
}


function _renderMarkdown {
	echo -e "$md_title"
	echo -e "\n_${md_shortdescription}_\n"
	echo -e '```'
	echo -e "\n$md_description\n"
	echo '```'
	echo -e "\n$md_screenshot\n"
	echo -e "\n $md_homepage"
	echo -e "\n### Installed packages\n"
	for i in $packages; do echo "* [$i](https://packages.debian.org/jessie/$i) - $(_getShortDescription $i)"; done

	echo -e "\n### Related packages\n"
	echo -n '<sub> '
	for i in $alts; do echo -n "[$i](https://packages.debian.org/jessie/$i) "; done
	echo ' </sub>'
}


function _main {
	for i in config/package-lists/*.list.chroot; do
		echo "$i"
		_genPackagesDoc $i > doc/packages/$(basename $i).md
	done
}

_main $@


#generate index
pkgindex=$(
	for i in Utility Office Multimedia Graphics Network System Games Science; do
		echo -e "\n### $i";
		for plist in config/package-lists/*.chroot; do
		    if egrep -q "^#Cat: $i" $plist; then
		        pname=$(egrep "^#Name:" $plist | cut -d" " -f1 --complement)
		        echo " - [$pname](packages/$(basename $plist).md)"
		    fi
		done
	done
)

pkgheader="# Installed software"


echo "$pkgheader
$pkgindex" > doc/packages.md
