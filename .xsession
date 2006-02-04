#!/bin/sh

# BROWSER=mymozilla
# export BROWSER

source $HOME/.bashrc

function fetch() {
    rm -f ~/.fetchmail.log
    #ssh-askpass "Mot de passe messagerie" | fetchmail -d 1200 --logfile ~/.fetchmail.log
    fetchmail -d 1200 --logfile ~/.fetchmail.log
}

if [ -r ~/.xdefaults ]; then
    xrdb -m ~/.xdefaults
fi

if [ -r /etc/netprofile/current ]; then
    . /etc/netprofile/current

    if [ -n "$PROFILE" -a "$PROFILE" = nonet ]; then
	emacs -f gnus-unplugged&
    else
	if [ -f $HOME/.fetchmail.pid ]; then
	    read pid sec < $HOME/.fetchmail.pid
	    if [ ! -r /proc/$pid ]; then
		fetch
	    fi
	else
	    fetch
	fi

	case "$PROFILE" in
	    default|home)
		exec /usr/bin/startkde;;
	esac

	rxvt&
    
	emacs -f gnus&
	mozilla&
	akregator&
	if type xchat > /dev/null 2>&1; then
	    xchat&
	fi
	skype&
    fi
fi

if [ -r $HOME/.calendar -a -x /usr/bin/ical ]; then
    ical -iconic&
fi

# if type licq > /dev/null 2>&1; then
#     licq&
# fi

rox --pinboard=MonPunaiseur

exec /usr/X11R6/bin/starticewm
exec icewm
exec xterm
