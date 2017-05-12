#!/bin/bash
#Desc: generate markdown package documentation from live-build config/packages.chroot directory
#License: WTFPL
#TODO: generate index of markdown files
#TODO screenshots: fetch multiple screenshots
export LANG="C"

function _genPackagesDoc {
packagelist=$1

pageheader="# Installed software

See [Usage](usage.md#Installing-removing-updating-software) for documentation on installing,
removing or updating software packages.
"
packages=$(egrep "^[a0-z9]" $packagelist)
mainpackage=$(echo "$packages " |head -n1)
md_title="# $(egrep "^#Name" $packagelist | cut -d" " -f1 --complement)"
alts=$(egrep "^#Alt:" $packagelist | cut -d" " -f1 --complement)
md_resources=
md_category=

if egrep "^#NoDescription" "$packagelist" >/dev/null; then
    md_description=""
    md_shortdescription=""
    md_homepage=""
else
    if egrep "^#Desc:" $packagelist >/dev/null; then
        descriptionpackage=$(egrep "^#Desc" $packagelist | cut -d" " -f1 --complement)
        else descriptionpackage=$mainpackage
    fi
    md_description="$(apt-cache show $descriptionpackage | egrep "^ " | egrep -v "::" | sed -e 's/^ \.$/ /g' | cut -b1 --complement)"
    md_shortdescription="_$(_getShortDescription $descriptionpackage)_"
    md_homepage="**[Homepage]($(apt-cache show $descriptionpackage | egrep "^Homepage:" | cut -d" " -f1 --complement))**"
fi

if egrep "^#Screenshot:" $packagelist >/dev/null; then
    screenshotpackage=$(egrep "^#Screenshot:" $packagelist | cut -d" " -f1 --complement)
    else screenshotpackage=$mainpackage
fi
md_screenshot="[![](https://screenshots.debian.net/thumbnail/$screenshotpackage/)](https://screenshots.debian.net/screenshot/$screenshotpackage/)"

_renderMarkdown

}

function _getShortDescription {
	apt-cache show $1 | egrep "Description(-en|-fr)" | cut -d" " -f1 --complement | head -n1
}


function _renderMarkdown {
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
	for i in $packages; do echo "* [$i](https://packages.debian.org/stretch/$i) - $(_getShortDescription $i)"; done

	echo -e "\n### Related packages\n"
	echo -n '<sub> '
	for i in $alts; do echo -n "[$i](https://packages.debian.org/stretch/$i) "; done
	echo ' </sub>'
}


function _main {
	for i in config/package-lists/*.list.chroot; do
		if ! egrep "#Cat:" "$i" >/dev/null; then
			echo "WARNING: No category defined for $i. List will not be included in the index page."
		fi
	done

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

	echo -e"\n### Non-debian packages";
	for deb in config/packages.chroot/*{all,amd64}.deb; do
		package=$(dpkg -I $deb | egrep "Package:" | awk -F' ' '{print $2}')
		homepage=$(dpkg -I $deb | egrep "Homepage:" | awk -F' ' '{print $2}')
		description=$(dpkg -I $deb | egrep "Description:" | awk '{$1=""; sub("  ", ""); print}')
		echo "* [$package]($homepage) - $description"
	done
)

echo "$pageheader
$pkgindex" > doc/packages.md
