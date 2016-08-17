#!/bin/bash

#package management
function pkgl { apt-cache show $@ | egrep \"^Description\" |egrep -v \"Description-md5\"| uniq | cut -d \" \" -f2- ; } #get a package's short description
alias pkgdel="sudo aptitude purge $@" #purge/delete packages
function pkgi { apt-cache show $@ | less ; } #get info on packages
alias pkgins="sudo aptitude install $@" #install packages
function pkgl { dpkg -L $@ | less ; } #list files from a package
function pkgs { apt-cache search $@ | less ; } #search for a package name or description
alias pkgup="sudo aptitude update; sudo aptitude upgrade" #update and upgrade packages
alias pkgver="apt-cache policy $@" #get package versions
alias pkgdep="apt-cache depends $@" #get package dependencies
alias pkgrdep="apt-cache rdepends $@" #get package reverse dependencies

#shortcuts
alias warn="for i in $(seq 1 3); do play -q /usr/share/sounds/freedesktop/stereo/complete.oga; done" #play a sound warning
alias d="colordiff" #pretty diffs
alias n="nano" #nano editor shortcut
alias m="mousepad" #mousepad editor shortcut
alias o="xdg-open" #generic open command
alias encrypt="gpg -c" #encrypt gpg encrypted file
alias decrypt="gpg -d" #decrypt gpg encrypted file
alias bak='cp -v "$1" "$1.`date +%Y-%m-%d_%H-%M-%S`.bak"' #Backup specified file, adding date after it
alias chx='chmod a+x' #set execute permission
alias clipboard='xclip -selection c; notify-send --icon=gtk-paste "Copied to clipboard." 2>/dev/null' #send a command output to clipboard
alias timestamp='date +"%Y-%m-%d_%H%M%S"'

function f { #find files
    find ./ -name "*$1*"
}
function psg { #find a process
    ps -fp $(pgrep -f $@)
}
function replace { #replace first word with 2nd word in specified file
    sed -i "s/$1/$2/g" "$3"
}

#aliases for going up multiple directories
alias .1='cd ../'
alias .2='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'

#network
function pingrouter { #find and ping router/gateway
    GATEWAY=$(ip route | grep "default via" | awk '{print $3}')
    if [ $? != 0 ];
        then echo "No internet gateways found"; exit 1
        else ping $GATEWAY
    fi
}

#ls and grep aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -F --color=auto'
    alias ll='ls -lhF --color=auto'
    alias ls='ls -F --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

#do not delete files with rm, put them to trash
alias rm="echo 'DO NOT USE RM. Use trash-put, or frm to force rm. Putting files to trash.'; trash-put $@"
#add an alias for rm anyway
alias frm="\rm"

#load autojump
if [ -f /usr/share/autojump/autojump.sh ]; then . /usr/share/autojump/autojump.sh; fi

#Close terminal after 10 minutes of inactivity (default disabled)
#export TMOUT=600

#Create directories and their parents (default disabled)
#alias mkdir='mkdir -pv'

#use a colored prompt
force_color_prompt=yes

#Use windows-style (cycling) Tab-completion (default disabled)
#bind '"\t":menu-complete'

#Automatically correct typos in directories names (default disabled)
#shopt -s cdspell

#Check recursively for subdirectories when using `cd` (default disabled)
#export CDPATH=.:~

#prevent ">" from overwriting existing files, use ">|" instead (default enabled)
set -C

#Automatically cd to a directory when you enter it's name on its own (default disabled)
#shopt -s autocd

#Append commands to history file
shopt -s histappend

####### Colored manpages ##########
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[36;7;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

#Syntax colors in less (possibly insecure, disabled)
#if [ -f /usr/share/source-highlight/src-hilite-lesspipe.sh ]
#then
#	export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
#	export LESS=' -R '
#fi

#git prompt configuration
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w $(__git_ps1 "(%s)")\[\033[00m\]\$ '
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="auto"
