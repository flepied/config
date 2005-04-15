# commands common to all logins -*- shell-script -*-

#export http_proxy=${http_proxy-http://proxywww:8080/}
export MINICOM=${MINICOM-"-c on"}
export HOSTNAME=${HOSTNAME-"`uname -n`"}
export PGPPATH=${PGPPATH-${HOME}/.pgpkeys}
export NNTPSERVER=${NNTPSERVER-news}
export IRCSERVER=${IRCSERVER-24.6.229.74}
#export PRINTER=${PRINTER-EpsonAcculaser2000}
#export PRINTER=${PRINTER-printer@192.168.100.3}
#export PRINTER=${PRINTER-printer}
export SMTPSERVER=${SMTPSERVER-extmailfr}
export RPM=${RPM=$HOME/RPM}
export SIMPLE_BACKUP_SUFFIX=${SIMPLE_BACKUP_SUFFIX=.fred}

# if type distcc > /dev/null 2>&1; then
# #    export DISTCC_HOSTS='ke no bi ka he enne hp6'
#     export RPM_BUILD_NCPUS=${RPM_BUILD_NCPUS=20}
#     export CC=${CC=distcc}
#     export CXX=${CXX='distcc g++'}
# fi

PATH="/usr/lib/icecream/bin:$HOME/private/bin:$HOME/bin:/usr/local/bin:/usr/X11R6/bin:/usr/bin:/bin:/usr/games:."
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

#PS1='`hostname`@`pwd`# '
    PS1='\u@\h:\w\$ '
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
    alias s='cd ..'
    alias cds='cd ~/RPM/SPECS'
    alias cdo='cd ~/RPM/SOURCES'
    alias cdb='cd ~/RPM/BUILD'
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
if [ -x $HOME/config/run-ssh ]; then
    source $HOME/config/run-ssh
fi

# bashrc ends here
