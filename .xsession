#!/bin/sh

source $HOME/.bashrc

if [ -n "$SSH_AUTH_SOCK" -a `uname -n` = skywalker.mandrakesoft.com ]; then
    if [ -f $HOME/.fetchmail.pid ]; then
        read pid sec < $HOME/.fetchmail.pid
        if [ ! -r /proc/$pid ]; then
            ssh-askpass "Mot de passe messagerie" | fetchmail -d 60 --logfile ~/.fetchmail.log
        fi
    else
        ssh-askpass "Mot de passe messagerie" | fetchmail -d 60 --logfile ~/.fetchmail.log
    fi
fi

if [ -r ~/.xdefaults ]; then
    xrdb -m ~/.xdefaults
fi

if [ -r $HOME/.calendar -a -x /usr/bin/ical ]; then
    ical -iconic&
fi

if [ -x /usr/X11R6/bin/xbuffy ]; then
    MAILPATH=/var/mail/flepied xbuffy -nobeep
fi

if type licq > /dev/null 2>&1; then
    licq&
fi

if type xchat > /dev/null 2>&1; then
    xchat&
fi

exec icewm
exec xterm
