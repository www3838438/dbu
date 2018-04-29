#!/bin/bash

#package management
function pkgl { apt-cache show "$@" | egrep \"^Description\" |egrep -v \"Description-md5\"| uniq | cut -d \" \" -f2- ; } #get a package's short description
alias pkgdel="sudo aptitude purge $*" #purge/delete packages
function pkgi { apt-cache show "$@" | less ; } #get info on packages
alias pkgins="sudo aptitude install $*" #install packages
function pkgl { dpkg -L "$@" | less ; } #list files from a package
function pkgs { apt-cache search "$@" | less ; } #search for a package name or description
alias pkgup="sudo aptitude update; sudo aptitude upgrade" #update and upgrade packages
alias pkgver="apt-cache policy $*" #get package versions
alias pkgdep="apt-cache depends $*" #get package dependencies
alias pkgrdep="apt-cache rdepends $*" #get package reverse dependencies

#shortcuts
alias warn="for i in 1 2 3 ; do play -q /usr/share/sounds/freedesktop/stereo/complete.oga; done" #play a sound warning
alias bell="while true; do play -q /usr/share/sounds/email.wav; sleep 0.2 ; done"
alias d="colordiff" #pretty diffs
alias n="nano" #nano editor shortcut
alias m="mousepad" #mousepad editor shortcut
alias o="xdg-open" #generic open command
alias encrypt="gpg -c" #encrypt gpg encrypted file
alias decrypt="gpg -d" #decrypt gpg encrypted file
function bak { cp -v "$1" "$1.`date +%Y-%m-%d_%H-%M-%S`.bak" ;} #Backup specified file, adding date after it
alias chx='chmod a+x' #set execute permission
alias clipboard='xclip -selection c; notify-send --icon=gtk-paste "Copied to clipboard." 2>/dev/null' #send a command output to clipboard
alias sortclipboard='xclip -selection c -o | sort | xclip -selection c -i'
alias timestamp='date +"%Y-%m-%d_%H%M%S"'
alias genpass='openssl rand -base64 24' #generate a random base64 string
alias lman='mank -k . |less' #list all manpages in pager
alias hman='man -Hx-www-browser' #manpages in browser/html

function f { #find files
    find ./ -name "*$1*"
}

function psg { #find processes
    ps -fp $(pgrep -f "$@")
}

function alert { # run alert <command> to get a visible red/green return status for the command
    $@
    if [[ $? == 0 ]]; then color="32"; msg="OK"; else color="31"; msg="ERROR"; fi
    for line in $(seq 1 10); do echo -e "\033[01;${color}m||||||||||||||| $msg |||||||||||||||\033[01;37m"; done
}

#aliases for going up multiple directories
alias .1='cd ../'
alias .2='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'

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

#do not delete files with rm, put them to trash (default disabled)
#alias rm="echo 'DO NOT USE RM. Use trash-put, or frm to force rm. Putting files to trash.'; trash-put $*"
#add an alias for rm
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
