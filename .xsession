#!/bin/bash

source $HOME/.bashrc

if [ `uname -n` = mofftarkin.mandrakesoft.com ]; then
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

exec fvwm2
exec xterm
