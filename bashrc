# commands common to all logins -*- shell-script -*-

export http_proxy=${http_proxy-http://proxywww:8080/}
export MINICOM=${MINICOM-"-c on"}
export HOSTNAME=${HOSTNAME-"`uname -n`"}
export PGPPATH=${PGPPATH-${HOME}/.pgpkeys}
export NNTPSERVER=${NNTPSERVER-news}
export IRCSERVER=${IRCSERVER-24.6.229.74}
export PRINTER=${PRINTER-lp}
export SMTPSERVER=${SMTPSERVER-extmailfr}
export CVS_RSH=${CVS_RSH=ssh}

PATH="$HOME/bin:/usr/local/bin:/usr/X11R6/bin:/usr/bin:/bin:/usr/games:."
LESS=-MM

umask 022

if [ -n "$PS1" ]
then

if [ "$TERM" = xterm-debian -o "$TERM" = xterm ]; then

function xterm-title() {
    echo -n ]2\;$*
}

function xterm-icon-title() {
    echo -n ]1\;$*
}

# change window and icon titles in one shot
function xterm-name() {
    echo -n ]0\;$*
}

fi

#xh <host> [command]
function xh () {
    host=$1;
    shift;
    xcmd=$*;
    ssh -f ${host:?"(Usage : xh host [command])"} \
    "env PATH=/usr/bin/X11:$PATH ${xcmd:="xterm -name xterm-$host"}"
}

#xhh <host> [command]
function xhh () {
    host=$1;
    shift;
    ssh -f ilana \
	"/usr/bin/X11/xrsh -debug ${host:?"(Usage : xhh host [command])"} $* "
}

#PS1='`hostname`:`pwd`# '
    PS1='\u:\h:\w\$ '
    PS2='> '
    if [ "$SHELL" = "/bin/pdksh" ]; then
	PS1="! $ "
    fi
    alias j='jobs'
    alias lc='ls -F'
    alias la='ls -a'
    alias ll='ls -la'
    alias m=more
    alias l=less
    alias +=pushd
    alias -- -=popd
#    alias \==dirs
    alias h='history'
    alias j='jobs -l'
    alias la='ls -a'
    alias lc='ls -CF'
    alias ll='ls -lg'
    alias lla='ls -la'
    alias psg='ps aucx | fgrep -v fgrep | fgrep '
    alias psh='ps aucx | head -15'
    alias lsh='ls -lt|head'
#
#
    LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:ex=01;32:*.cmd=01;32:*.exe=01;32:*.com=01;32:*.btm=01;32:*.bat=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.jpg=01;35:*.gif=01;35:*.bmp=01;35:*.xbm=01;35:*.xpm=01;35:';
    export LS_COLORS;
    LS_OPTIONS='--color=tty';
    export LS_OPTIONS;
    PAGER=${PAGER-less}
    export PAGER
    alias ls='ls $LS_OPTIONS';
    alias dir='ls $LS_OPTIONS --format=vertical';
    alias vdir='ls $LS_OPTIONS --format=long';
    alias d=dir;
    alias v=vdir;
    # alias net='term < /dev/modem > /dev/modem 2> /dev/null&'
    # alias startx='startx >& /dev/null'
    ignoreeof=10
    export PS1 PS2 ignoreeof
    if [ -x /usr/games/fortune ]
    then
	    echo
	    /usr/games/fortune
	    echo
    fi
fi # isatty

#set -x

# ssh stuff
if [ -r "$HOME/.ssh/identity" ]; then
    if [ -z "$SSH_AUTH_SOCK" ]; then
        sock=`ls -t /tmp/ssh-$USER/*agent* 2>/dev/null | head -1`
    else
	sock=$SSH_AUTH_SOCK
    fi
    if [ -S "$sock" ]; then
	SSH_AUTH_SOCK=$sock
	export SSH_AUTH_SOCK
    else
	eval `ssh-agent`
    fi
    # we have now an agent running

    # ask the pass phrase only in interactive session
    if [ -n "$PS1" ]
    then
	# test if the agent has already an identity
	ssh-add -l | fgrep -i 'no identit' > /dev/null 2>&1

	# if not try to add the default one
	if [ $? == 0 ]; then
            if [ -z "$DISPLAY" ]; then
		ssh-add
            else
                ssh-add < /dev/null
	    fi
	fi
    fi
fi

# bashrc ends here
