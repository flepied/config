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

    mozilla-firefox&
    
    exec /usr/bin/startgnome	
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
